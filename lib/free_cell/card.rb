class Card
  def initialize(id)
    self.id = id
    return if id.is_a?(Numeric) && id.integer? && (0..51).include?(id)

    raise ArgumentError, "expected 0..51, got #{id}"
  end

  # An integer between 0-3, inclusive, representing the 4
  # different suits.
  def suit_value
    @suit_value ||= id % 4
  end

  # An integer between 1-13, inclusive, representing the 13
  # difference faces.
  def face_value
    @face_value ||= (id / 4) + 1
  end

  def to_s
    "#{face}#{suit}"
  end

  def inspect
    "#<Card #{self}>"
  end

  def ==(other)
    id == other.id
  end

  protected

  # An integer between 0-51, inclusive, representing the 52
  # different cards in a deck.
  attr_accessor :id

  private

  def suit
    case suit_value
    when 0
      "♣"
    when 1
      "♦"
    when 2
      "♥"
    when 3
      "♠"
    end
  end

  def face
    return "A" if face_value == 1
    return "J" if face_value == 11
    return "Q" if face_value == 12
    return "K" if face_value == 13

    face_value.to_s
  end
end
