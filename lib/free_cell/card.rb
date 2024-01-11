class Card
  SUITS = ["♣", "♦", "♥", "♠"].freeze

  attr_reader :face_value, :suit_value, :to_s

  def initialize(id)
    raise ArgumentError, "expected 0..51, got #{id}" unless id.is_a?(Numeric) && id.integer? && (0..51).include?(id)

    self.face_value = (id / 4) + 1
    self.suit_value = id % 4
    self.to_s = "#{face}#{suit}".freeze
  end

  def inspect
    "#<Card #{self}>"
  end

  def ==(other)
    to_s == other.to_s
  end

  protected

  attr_writer :face_value, :suit_value, :to_s

  private

  def suit
    SUITS[suit_value]
  end

  def face
    return "A" if face_value == 1
    return "J" if face_value == 11
    return "Q" if face_value == 12
    return "K" if face_value == 13

    face_value.to_s
  end
end
