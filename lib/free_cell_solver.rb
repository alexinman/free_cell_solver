require_relative "card"
require_relative "cards"
require_relative "deck"
require_relative "location"
require_relative "cell"
require_relative "foundation"
require_relative "cascade"
require_relative "state"
require_relative "state_formatter"
require_relative "state_duplicator"
require_relative "state_generator"

class FreeCellSolver
  attr_accessor :deck

  def initialize(filename)
    self.deck = filename.empty? ? Deck.new.shuffle : Deck.parse(File.read(filename))
  end

  def solve
    raise NotImplementedError
  end
end
