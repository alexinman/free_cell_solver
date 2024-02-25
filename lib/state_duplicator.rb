module StateDuplicator
  def self.dup(state)
    cells = state.cells.map(&:dup)
    foundations = state.foundations.map(&:dup)
    cascades = state.cascades.map { |cascade| Cascade.new(cascade.cards) }
    State.new(cells, foundations, cascades)
  end
end
