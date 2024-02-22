class Deck < Array
  def initialize
    super(52, &Card.method(:new))
  end

  def self.parse(input)
    cards = input.split(/\s+/).map { Card.parse(_1) }
    raise ArgumentError, "invalid: expected 52 cards, got #{cards.size}" if cards.size != 52
    raise ArgumentError, "invalid: expected unique cards" if cards != cards.uniq(&:to_s)

    cards
  end
end
