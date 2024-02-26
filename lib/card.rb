class Card
  SUITS = ["♥", "♣", "♦", "♠"].freeze

  attr_reader :color, :face_value, :suit_value, :to_s

  def initialize(id)
    raise ArgumentError, "expected 0..51, got #{id}" unless id.is_a?(Numeric) && id.integer? && (0..51).include?(id)

    self.face_value = (id / 4) + 1
    self.suit_value = id % 4
    self.color = parse_color
    self.to_s = "#{face}#{suit}".freeze
  end

  def inspect
    "#<Card #{self}>"
  end

  def ==(other)
    to_s == other.to_s
  end

  alias eql? ==

  def hash
    to_s.hash
  end

  def self.parse(input)
    raise ArgumentError, "invalid: #{input}" unless (2..3).include?(input.size)

    Card.new((parse_face_value(input) * 4) + parse_suit_value(input))
  end

  def self.parse_suit_value(input)
    return 0 if ["H", "♥"].include? input[-1].upcase
    return 1 if ["C", "♣"].include? input[-1].upcase
    return 2 if ["D", "♦"].include? input[-1].upcase
    return 3 if ["S", "♠"].include? input[-1].upcase

    raise ArgumentError, "invalid: #{input}"
  end

  def self.parse_face_value(input)
    return 0 if input.chop.upcase == "A"
    return 10 if input.chop.upcase == "J"
    return 11 if input.chop.upcase == "Q"
    return 12 if input.chop.upcase == "K"

    parse_number_face_value(input)
  end

  def self.parse_number_face_value(input)
    value = input.chop.to_i - 1
    raise ArgumentError, "invalid: #{input}" unless (1..9).include?(value)

    value
  end

  protected

  attr_writer :color, :face_value, :suit_value, :to_s

  private

  def parse_color
    (suit_value % 2).zero? ? :red : :black
  end

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
