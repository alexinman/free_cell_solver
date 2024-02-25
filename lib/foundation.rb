class Foundation < Location
  def initialize
    super([])
  end

  def add?(cards)
    return false unless cards.length == 1

    value = self.cards.last&.face_value || 0
    return false unless cards.first.face_value == value + 1

    suit = self.cards.last&.suit_value
    suit.nil? || suit == cards.first.suit_value
  end

  def remove?(number)
    number == 1 && !cards.empty?
  end
end
