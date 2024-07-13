class Location
  # Hi Candice, this is the first class you'll need to implement.
  # All functionality is described in the tests in location_test.rb.
  # You'll need to implement the following methods:

  def initialize(cards_in = [])
    self.cards = cards_in.dup
  end

  # *****************************************************
  def add(cards)
    self.cards = self.cards + cards
  end

  # *****************************************************
  def add?(cards)
    raise NotImplementedError
  end

  # *****************************************************
  def remove(number)
    @cards.pop(number)
  end

  # *****************************************************
  def remove?(number)
    raise NotImplementedError
  end

  # *****************************************************
  def cards
    @cards.dup
  end

  # *****************************************************
  def empty?
    cards.empty?
  end

  # *****************************************************
  def <=>(other)
    return unless other.instance_of?(Location)

    cards <=> other.cards
  end

  # *****************************************************
  def ==(other)
    other.class == self.class && cards == other.cards
  end

  # *****************************************************
  def eql?(other)
    self == other
  end

  # *****************************************************
  def hash
    @cards.hash
  end
  # *****************************************************

  private

  attr_writer :cards

  # And you can validate your implementation by running `rake`.
  # Good luck!
end
