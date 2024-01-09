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
end
