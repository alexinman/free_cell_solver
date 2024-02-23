require "test_helper"

describe Card do
  describe "when initializing with a value less than 0" do
    it "must raise an ArgumentError" do
      assert_raises_with_message(ArgumentError, "expected 0..51, got -1") { Card.new(-1) }
    end
  end

  describe "when initializing with a value greater than 51" do
    it "must raise an ArgumentError" do
      assert_raises_with_message(ArgumentError, "expected 0..51, got 52") { Card.new(52) }
    end
  end

  describe "when initializing with a non-integer value" do
    it "must raise an ArgumentError" do
      assert_raises_with_message(ArgumentError, "expected 0..51, got 4.5") { Card.new(4.5) }
    end
  end

  describe "when initializing with a non-numeric value" do
    it "must raise an ArgumentError" do
      assert_raises_with_message(ArgumentError, "expected 0..51, got foo") { Card.new("foo") }
    end
  end

  describe "when calling #suit_value on a valid card" do
    it "must return the correct value" do
      assert_equal 0, Card.new(0).suit_value
      assert_equal 1, Card.new(1).suit_value
      assert_equal 2, Card.new(2).suit_value
      assert_equal 3, Card.new(3).suit_value

      assert_equal 0, Card.new(4).suit_value
      assert_equal 1, Card.new(5).suit_value
      assert_equal 2, Card.new(6).suit_value
      assert_equal 3, Card.new(7).suit_value
    end
  end

  describe "when calling #face_value on a valid card" do
    it "must return the correct value" do
      assert_equal 1, Card.new(0).face_value
      assert_equal 1, Card.new(1).face_value
      assert_equal 1, Card.new(2).face_value
      assert_equal 1, Card.new(3).face_value

      assert_equal 2, Card.new(4).face_value
      assert_equal 2, Card.new(5).face_value
      assert_equal 2, Card.new(6).face_value
      assert_equal 2, Card.new(7).face_value
    end
  end

  describe "when calling #to_s on a valid card" do
    it "must return the correct value" do
      assert_equal "A♣", Card.new(0).to_s
      assert_equal "A♦", Card.new(1).to_s
      assert_equal "A♥", Card.new(2).to_s
      assert_equal "A♠", Card.new(3).to_s

      assert_equal "2♣", Card.new(4).to_s
      assert_equal "2♦", Card.new(5).to_s
      assert_equal "2♥", Card.new(6).to_s
      assert_equal "2♠", Card.new(7).to_s

      assert_equal "J♣", Card.new(40).to_s
      assert_equal "J♦", Card.new(41).to_s
      assert_equal "J♥", Card.new(42).to_s
      assert_equal "J♠", Card.new(43).to_s

      assert_equal "Q♣", Card.new(44).to_s
      assert_equal "Q♦", Card.new(45).to_s
      assert_equal "Q♥", Card.new(46).to_s
      assert_equal "Q♠", Card.new(47).to_s

      assert_equal "K♣", Card.new(48).to_s
      assert_equal "K♦", Card.new(49).to_s
      assert_equal "K♥", Card.new(50).to_s
      assert_equal "K♠", Card.new(51).to_s
    end
  end

  describe "when calling #== on a valid card" do
    describe "with a card that has the same id" do
      it "must return true" do
        card1 = Card.new(0)
        card2 = Card.new(0)

        assert_equal card1, card2
      end
    end

    describe "with a card that has a different id" do
      it "must return false" do
        card1 = Card.new(0)
        card2 = Card.new(1)

        refute_equal card1, card2
      end
    end
  end

  describe "when calling #inspect" do
    it "must return a string representing the object" do
      card = Card.new(0)

      assert_equal "#<Card #{card}>", card.inspect
    end
  end

  describe "when calling .parse" do
    it "must properly parse an ace of clubs" do
      card = Card.parse("Ac")

      assert_equal "A♣", card.to_s
    end

    it "must properly parse a two of hearts" do
      card = Card.parse("2h")

      assert_equal "2♥", card.to_s
    end

    it "must properly parse a 10 of spades" do
      card = Card.parse("10s")

      assert_equal "10♠", card.to_s
    end

    it "must properly parse a jack of diamonds" do
      card = Card.parse("Jd")

      assert_equal "J♦", card.to_s
    end

    it "must properly parse a queen" do
      card = Card.parse("Qd")

      assert_equal "Q♦", card.to_s
    end

    it "must properly parse a king" do
      card = Card.parse("Kd")

      assert_equal "K♦", card.to_s
    end

    it "must raise an ArgumentError when an invalid card is provided" do
      assert_raises_with_message(ArgumentError, "invalid: 11f") { Card.parse("11f") }
      assert_raises_with_message(ArgumentError, "invalid: ") { Card.parse("") }
      assert_raises_with_message(ArgumentError, "invalid: -1d") { Card.parse("-1d") }
      assert_raises_with_message(ArgumentError, "invalid: 20h") { Card.parse("20h") }
      assert_raises_with_message(ArgumentError, "invalid: 0h") { Card.parse("0h") }
      assert_raises_with_message(ArgumentError, "invalid: 9e") { Card.parse("9e") }
    end
  end
end
