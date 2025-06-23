require "test_helper"

describe Deck do
  describe "when initializing a deck" do
    it "must have 52 cards" do
      assert_equal 52, Deck.new.size
    end

    it "must be an instance of Deck" do
      assert_instance_of Deck, Deck.new
    end

    it "must be a kind of Array" do
      assert_kind_of Array, Deck.new
    end

    it "must have all unique elements" do
      deck = Deck.new

      assert_equal deck, deck.uniq
    end

    it "must contain only cards" do
      assert Deck.new.all?(Card), "Expected all elements to be of type Card"
    end
  end

  describe "when parsing cards" do
    it "must return an array of 52 unique cards" do
      faces = ["a", "2", "3", "4", "5", "6", "7", "8", "9", "10", "j", "q", "k"]
      suits = ["s", "h", "c", "d"]
      input = faces.product(suits).map(&:join).join(" ")

      cards = Deck.parse(input)

      assert_equal 52, cards.size
      assert_equal cards, cards.uniq
      assert_equal "A♠", cards.first.to_s
      assert_equal "K♦", cards.last.to_s
    end

    it "must raise an exception if there isn't 52 cards" do
      assert_raises_with_message(ArgumentError, "invalid: expected 52 cards, got 0") { Deck.parse("") }
      assert_raises_with_message(ArgumentError, "invalid: expected 52 cards, got 51") { Deck.parse("as " * 51) }
      assert_raises_with_message(ArgumentError, "invalid: expected 52 cards, got 53") { Deck.parse("as " * 53) }
    end

    it "must raise an exception if there are duplicate cards" do
      assert_raises_with_message(ArgumentError, "invalid: expected unique cards") { Deck.parse("as " * 52) }
    end

    it "must raise an exception if there are any invalid cards" do
      assert_raises_with_message(ArgumentError, "invalid: 11f") { Deck.parse("11f") }
      assert_raises_with_message(ArgumentError, "invalid: -1d") { Deck.parse("-1d") }
      assert_raises_with_message(ArgumentError, "invalid: 20h") { Deck.parse("20h") }
      assert_raises_with_message(ArgumentError, "invalid: 0h") { Deck.parse("0h") }
      assert_raises_with_message(ArgumentError, "invalid: 9e") { Deck.parse("9e") }
    end
  end
end
