module StateDuplicator
  def self.dup(state)
    cells = state.cells.map { |cell| Cell.new(cell.cards) }
    foundations = state.foundations.map { |foundation| Foundation.new(foundation.cards) }
    cascades = state.cascades.map { |cascade| Cascade.new(cascade.cards) }
    State.new(cells, foundations, cascades)
  end
end
