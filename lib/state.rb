class State
  attr_reader :cascades, :cells, :foundations

  def initialize(cells, foundations, cascades)
    self.cells = cells.freeze
    self.foundations = foundations.freeze
    self.cascades = cascades.freeze
  end

  class << self
    def build(deck)
      cells = Array.new(4) { Cell.new }.freeze
      foundations = Array.new(4) { Foundation.new }.freeze
      cascades = deal(deck)
      new(cells, foundations, cascades)
    end

    private

    def deal(deck)
      Array.new(8) do |i|
        Cascade.new(Array.new(7) { |j| deck[i + (8 * j)] }.compact)
      end.freeze
    end
  end

  def ==(other)
    other.instance_of?(self.class) &&
      cells == other.cells &&
      foundations == other.foundations &&
      cascades == other.cascades
  end

  alias eql? ==

  private

  attr_writer :cascades, :cells, :foundations
end
