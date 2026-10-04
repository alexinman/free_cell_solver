require "test_helper"

describe Cascade do
  describe "when asking if cards can be added" do
    it "returns true if valid" do
      cascade = Cascade.new([Cards::FOUR_OF_HEARTS])
      cards = [Cards::THREE_OF_SPADES, Cards::TWO_OF_DIAMONDS, Cards::ACE_OF_CLUBS]

      assert cascade.add?(cards)
    end

    it "returns true if cascade is empty and cards being added are valid" do
      cascade = Cascade.new
      cards = [Cards::THREE_OF_SPADES, Cards::TWO_OF_DIAMONDS, Cards::ACE_OF_CLUBS]

      assert cascade.add?(cards)
    end

    it "returns false if cards are not alternating colors" do
      cascade = Cascade.new([Cards::FOUR_OF_HEARTS])
      cards = [Cards::THREE_OF_SPADES, Cards::TWO_OF_CLUBS, Cards::ACE_OF_SPADES]

      refute cascade.add?(cards)
    end

    it "returns false if cards are not descending values" do
      cascade = Cascade.new([Cards::FOUR_OF_HEARTS])
      cards = [Cards::THREE_OF_SPADES, Cards::FIVE_OF_DIAMONDS, Cards::ACE_OF_CLUBS]

      refute cascade.add?(cards)
    end

    it "returns false if first card is not one less than last card" do
      cascade = Cascade.new([Cards::FOUR_OF_HEARTS])
      cards = [Cards::FOUR_OF_SPADES, Cards::THREE_OF_DIAMONDS, Cards::TWO_OF_CLUBS]

      refute cascade.add?(cards)
    end

    it "returns false if first card is the same color as the last card" do
      cascade = Cascade.new([Cards::FOUR_OF_HEARTS])
      cards = [Cards::THREE_OF_HEARTS, Cards::TWO_OF_DIAMONDS, Cards::ACE_OF_CLUBS]

      refute cascade.add?(cards)
    end
  end

  describe "when asking if cards can be removed" do
    it "returns true if valid" do
      cascade = Cascade.new(
        [
          Cards::FOUR_OF_HEARTS,
          Cards::THREE_OF_SPADES,
          Cards::TWO_OF_DIAMONDS,
          Cards::ACE_OF_CLUBS
        ]
      )

      assert cascade.remove?(1)
      assert cascade.remove?(2)
      assert cascade.remove?(3)
      assert cascade.remove?(4)
    end

    it "returns false if cards are not alternating colors" do
      cascade = Cascade.new(
        [
          Cards::FOUR_OF_HEARTS,
          Cards::THREE_OF_SPADES,
          Cards::TWO_OF_CLUBS,
          Cards::ACE_OF_SPADES
        ]
      )

      assert cascade.remove?(1)
      refute cascade.remove?(2)
      refute cascade.remove?(3)
      refute cascade.remove?(4)
    end

    it "returns false if cards are not descending values" do
      cascade = Cascade.new(
        [
          Cards::FOUR_OF_HEARTS,
          Cards::THREE_OF_SPADES,
          Cards::FIVE_OF_DIAMONDS,
          Cards::ACE_OF_CLUBS
        ]
      )

      assert cascade.remove?(1)
      refute cascade.remove?(2)
      refute cascade.remove?(3)
      refute cascade.remove?(4)
    end

    it "returns false if trying to remove more cards than are in the cascade" do
      cascade = Cascade.new(
        [
          Cards::FOUR_OF_HEARTS,
          Cards::THREE_OF_SPADES,
          Cards::TWO_OF_DIAMONDS,
          Cards::ACE_OF_CLUBS
        ]
      )

      refute cascade.remove?(5)
    end
  end
end
