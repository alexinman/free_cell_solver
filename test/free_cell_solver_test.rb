require "test_helper"

describe FreeCellSolver do
  describe "when initializing with an empty string" do
    it "must deal a shuffled deck" do
      solver = FreeCellSolver.new("")

      assert_equal 52, solver.deck.size
      refute_equal solver.deck, solver.deck.sort_by(&:to_s)
    end
  end

  describe "when initializing with a filename" do
    it "must deal the deck from the file" do
      solver = FreeCellSolver.new("games/game1.txt")
      expected = [
        "J♣", "J♠", "3♦", "5♦", "9♠", "9♦", "2♦", "8♣",
        "5♠", "A♠", "5♣", "10♠", "2♠", "A♦", "9♣", "4♠",
        "4♥", "2♣", "J♥", "7♣", "K♥", "3♥", "5♥", "J♦",
        "9♥", "7♦", "10♣", "8♠", "4♣", "10♥", "3♠", "A♥",
        "6♦", "8♥", "K♣", "K♦", "3♣", "6♣", "K♠", "8♦",
        "A♣", "7♠", "2♥", "10♦", "6♥", "Q♠", "7♥", "Q♣",
        "Q♦", "Q♥", "6♠", "4♦"
      ]

      assert_equal expected, solver.deck.map(&:to_s)
    end
  end

  describe "when solving" do
    it "must raise NotImplementedError" do
      solver = FreeCellSolver.new("")
      assert_raises(NotImplementedError) { solver.solve }
    end
  end
end
