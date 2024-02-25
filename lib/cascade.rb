class Cascade < Location
  def add?(cards)
    return false unless alternating_colors?(cards)
    return false unless descending_values?(cards)
    return true if self.cards.empty?

    self.cards.last.color != cards.first.color && self.cards.last.face_value - 1 == cards.first.face_value
  end

  def remove?(number)
    cards.length >= number && alternating_colors?(cards.last(number)) && descending_values?(cards.last(number))
  end

  private

  def alternating_colors?(cards)
    cards.map(&:color).each_cons(2).all? { |c1, c2| c1 != c2 }
  end

  def descending_values?(cards)
    cards.map(&:face_value).each_cons(2).all? { |v1, v2| v1 - 1 == v2 }
  end
end
