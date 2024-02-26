module StateGenerator
  class << self
    def generate(state)
      max = determine_max(state)
      locations = state.foundations + state.cells + state.cascades
      locations.permutation(2).flat_map { |from, to| generate_between(state, from, to, max) }
    end

    private

    def determine_max(state)
      m = state.cascades.count(&:empty?)
      n = state.cells.count(&:empty?)
      (2**m) * (n + 1)
    end

    def generate_between(state, from, to, max)
      return [] if useless_move?(from, to)

      max /= 2 if empty_cascade?(to)
      max = 1 unless cascades?(from, to)

      (1..max).map { |n| generate_state(state, from, to, n) }.compact
    end

    def generate_state(state, from, to, num)
      return unless from.remove?(num) && to.add?(from.cards.last(num))

      to.add(from.remove(num))
      new_state = StateDuplicator.dup(state)
      from.add(to.remove(num))

      new_state
    end

    def cascades?(from, to)
      from.is_a?(Cascade) && to.is_a?(Cascade)
    end

    def empty_cascade?(to)
      to.is_a?(Cascade) && to.empty?
    end

    def useless_move?(from, to)
      from.instance_of?(to.class) && !from.is_a?(Cascade)
    end
  end
end
