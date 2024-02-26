require "test_helper"

describe Foundation do
  describe "when asking if it can add cards" do
    it "must return true if it has no cards and the cards to add is an Ace" do
      foundation = Foundation.new
      assert foundation.add?([Cards::ACE_OF_SPADES])
      assert foundation.add?([Cards::ACE_OF_HEARTS])
      assert foundation.add?([Cards::ACE_OF_DIAMONDS])
      assert foundation.add?([Cards::ACE_OF_CLUBS])
    end

    it "must return false if it has cards and the card to add is not the next in sequence" do
      foundation = Foundation.new
      foundation.add([Cards::ACE_OF_HEARTS])
      refute foundation.add?([Cards::THREE_OF_HEARTS])
      refute foundation.add?([Cards::TWO_OF_CLUBS])
      refute foundation.add?([Cards::TWO_OF_SPADES])
      refute foundation.add?([Cards::TWO_OF_DIAMONDS])
    end

    it "must return false if there is more than one card" do
      foundation = Foundation.new
      refute foundation.add?([Card.new(1), Card.new(2)])
    end

    it "must return true if the card to add is the next in sequence" do
      foundation = Foundation.new
      foundation.add([Cards::ACE_OF_HEARTS])
      assert foundation.add?([Cards::TWO_OF_HEARTS])
      foundation.add([Cards::TWO_OF_HEARTS])
      assert foundation.add?([Cards::THREE_OF_HEARTS])
    end
  end

  describe "when asking if it can remove cards" do
    it "must return true if it has cards" do
      foundation = Foundation.new
      foundation.add([Cards::ACE_OF_HEARTS])
      assert foundation.remove?(1)
    end

    it "must return false if it has no cards" do
      foundation = Foundation.new
      refute foundation.remove?(1)
    end

    it "must return false if the number of cards to remove is not 1" do
      foundation = Foundation.new
      foundation.add([Cards::ACE_OF_HEARTS, Cards::TWO_OF_HEARTS])
      refute foundation.remove?(2)
    end
  end
end
