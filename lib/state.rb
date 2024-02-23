class State
  attr_reader :cascades, :cells, :foundations

  def initialize(deck)
    self.cells = Array.new(4) { Cell.new }.freeze
    self.foundations = Array.new(4) { Foundation.new }.freeze
    self.cascades = deal(deck)
  end

  private

  attr_writer :cascades, :cells, :foundations

  def deal(deck)
    Array.new(8) do |i|
      Cascade.new(Array.new(7) { |j| deck[i + (8 * j)] }.compact)
    end.freeze
  end
end
