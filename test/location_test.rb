require "test_helper"

describe Location do
  describe "when initializing with no cards" do
    it "must have no cards" do
      location = Location.new
      assert_empty location.cards
    end
  end

  describe "when initializing with cards" do
    it "must have the cards" do
      cards = [Card.new(1)]
      location = Location.new(cards)
      assert_equal cards, location.cards
    end
  end

  it "must raise a NotImplementedError when calling add?" do
    assert_raises(NotImplementedError) { Location.new.add?([]) }
  end

  describe "when adding cards" do
    it "must add the cards" do
      card1 = Card.new(1)
      card2 = [Card.new(2)]
      location = Location.new([card1])

      location.add([card2])

      assert_equal [card1, card2], location.cards
    end

    it "must not modify the original cards" do
      card1 = Card.new(1)
      card2 = [Card.new(2)]
      original_cards = [card1]
      location = Location.new(original_cards)

      location.add([card2])

      assert_equal [card1], original_cards
    end
  end

  it "must raise a NotImplementedError when calling remove?" do
    assert_raises(NotImplementedError) { Location.new.remove?(1) }
  end

  describe "when removing cards" do
    it "must remove the correct number of cards and return them" do
      card1 = Card.new(1)
      card2 = Card.new(2)
      card3 = Card.new(3)

      location1 = Location.new([card1, card2, card3])
      location2 = Location.new([card1, card2, card3])
      location3 = Location.new([card1, card2, card3])

      removed_cards1 = location1.remove(1)
      removed_cards2 = location2.remove(2)
      removed_cards3 = location3.remove(3)

      assert_equal [card3], removed_cards1
      assert_equal [card2, card3], removed_cards2
      assert_equal [card1, card2, card3], removed_cards3

      assert_equal [card1, card2], location1.cards
      assert_equal [card1], location2.cards
      assert_equal [], location3.cards
    end

    it "must not modify the original cards" do
      card1 = Card.new(1)
      card2 = Card.new(2)
      original_cards = [card1, card2]
      location = Location.new(original_cards)

      location.remove(1)

      assert_equal [card1, card2], original_cards
    end
  end

  it "must allow read-only access to cards" do
    card1 = Card.new(1)
    card2 = Card.new(2)
    location = Location.new([card1, card2])

    cards = location.cards
    cards.pop

    assert_equal [card1, card2], location.cards

    assert_raises(NoMethodError) { location.cards = [] }
  end
end
