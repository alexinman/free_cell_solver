class Cell < Location
  def initialize
    super([])
  end

  def add?(cards)
    cards.length == 1 && self.cards.empty?
  end

  def remove?(number)
    number == 1 && !cards.empty?
  end
end
