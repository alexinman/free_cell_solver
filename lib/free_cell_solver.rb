require_relative "card"
require_relative "cards"
require_relative "deck"

class FreeCellSolver
  attr_accessor :deck

  def initialize(filename)
    self.deck = filename.empty? ? Deck.new.shuffle : Deck.parse(File.read(filename))
  end

  def solve
    raise NotImplementedError
  end
end
