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

  it "must be empty when it has no cards" do
    assert_empty Location.new
  end

  it "must not be empty when it has cards" do
    refute_empty Location.new([Card.new(1)])
  end

  it "must be equal to another location with the same cards" do
    card1 = Card.new(1)
    card2 = Card.new(2)
    location1 = Location.new([card1, card2])
    location2 = Location.new([card1, card2])

    assert_equal location1, location2
    refute_equal location1.object_id, location2.object_id
  end

  it "must not be equal to another location with different cards" do
    card1 = Card.new(1)
    card2 = Card.new(2)
    location1 = Location.new([card1, card2])
    location2 = Location.new([card1])

    refute_equal location1, location2
  end

  it "must not be equal to non-Location objects" do
    card = Card.new(1)
    location = Location.new([card])

    test_location = TestLocation.new([card])

    refute_equal location, card
    refute_equal location, nil
    refute_equal location, 1
    refute_equal location, "location"
    refute_equal location, test_location
    refute_equal test_location, location
  end

  it "must be considered uniq by its cards" do
    card1 = Card.new(1)
    card2 = Card.new(2)
    location1 = Location.new([card1, card2])
    location2 = Location.new([card1])
    location3 = Location.new([card1, card2])

    locations = [location1, location2, location3]
    assert_equal [location1, location2], locations.uniq
  end

  describe "when sorting locations" do
    it "must sort them by their cards" do
      card1 = Card.new(1)
      card2 = Card.new(2)
      card3 = Card.new(3)
      location1 = Location.new
      location2 = Location.new([card1, card2])
      location3 = Location.new([card1, card2, card3])
      location4 = Location.new([card1, card3])
      location5 = Location.new([card2, card1])

      expected = [location1, location2, location3, location4, location5]
      assert_equal expected, [location5, location4, location3, location1, location2].sort
    end
  end

  describe "when comparing with not a Location" do
    it "must fail" do
      assert_nil Location.new <=> "foo"
      assert_nil Location.new <=> TestLocation.new
    end
  end

  it "must not be eql? to non-Location objects" do
    card = Card.new(1)
    location = Location.new([card])

    test_location = TestLocation.new([card])

    refute location.eql?(card)
    refute location.eql?(nil)
    refute location.eql?(1)
    refute location.eql?("location")
    refute location.eql?(test_location)
    refute test_location.eql?(location)
  end
end

class TestLocation < Location
end
