require "test_helper"

describe State do
  describe "when initializing a state" do
    it "must have 4 empty cells" do
      state = State.new(Deck.new)
      assert_equal 4, state.cells.size
      assert state.cells.all?(Cell), "Expected all elements to be of type Cell"
      assert state.cells.all?(&:empty?), "Expected all elements to be empty"
    end

    it "must have 4 empty foundations" do
      state = State.new(Deck.new)
      assert_equal 4, state.foundations.size
      assert state.foundations.all?(Foundation), "Expected all elements to be of type Foundation"
      assert state.foundations.all?(&:empty?), "Expected all elements to be empty"
    end

    it "must have 8 cascades" do
      state = State.new(Deck.new)
      assert_equal 8, state.cascades.size
      assert state.cascades.all?(Cascade), "Expected all elements to be of type Cascade"
    end

    it "must properly deal deck to cascades" do
      deck = Deck.parse(File.read('games/game1.txt'))
      state = State.new(deck)

      assert_equal ["J♣", "5♠", "4♥", "9♥", "6♦", "A♣", "Q♦"], state.cascades[0].cards.map(&:to_s)
      assert_equal ["J♠", "A♠", "2♣", "7♦", "8♥", "7♠", "Q♥"], state.cascades[1].cards.map(&:to_s)
      assert_equal ["3♦", "5♣", "J♥", "10♣", "K♣", "2♥", "6♠"], state.cascades[2].cards.map(&:to_s)
      assert_equal ["5♦", "10♠", "7♣", "8♠", "K♦", "10♦", "4♦"], state.cascades[3].cards.map(&:to_s)
      assert_equal ["9♠", "2♠", "K♥", "4♣", "3♣", "6♥"], state.cascades[4].cards.map(&:to_s)
      assert_equal ["9♦", "A♦", "3♥", "10♥", "6♣", "Q♠"], state.cascades[5].cards.map(&:to_s)
      assert_equal ["2♦", "9♣", "5♥", "3♠", "K♠", "7♥"], state.cascades[6].cards.map(&:to_s)
      assert_equal ["8♣", "4♠", "J♦", "A♥", "8♦", "Q♣"], state.cascades[7].cards.map(&:to_s)
    end
  end

  it "must not allow cells, foundations, and cascades to be modified" do
    state = State.new(Deck.new)
    assert_raises(RuntimeError) { state.cells[0] = Cell.new }
    assert_raises(RuntimeError) { state.foundations[0] = Foundation.new }
    assert_raises(RuntimeError) { state.cascades[0] = Cascade.new }
  end

  it "must not allow cells, foundations, and cascades to be replaced" do
    state = State.new(Deck.new)
    assert_raises(NoMethodError) { state.cells = [Cell.new] }
    assert_raises(NoMethodError) { state.foundations = [Foundation.new] }
    assert_raises(NoMethodError) { state.cascades = [Cascade.new] }
  end
end
