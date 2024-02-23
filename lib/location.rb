class Location
  def initialize(cards = [])
    self.internal_cards = cards.dup
  end

  def add?(_cards)
    raise NotImplementedError
  end

  def add(cards)
    self.internal_cards += cards
  end

  def remove?(_number)
    raise NotImplementedError
  end

  def remove(number)
    internal_cards.pop(number)
  end

  def cards
    internal_cards.dup
  end

  def empty?
    internal_cards.empty?
  end

  private

  attr_accessor :internal_cards
end
