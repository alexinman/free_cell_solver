require "test_helper"

describe State do
  describe "when initializing" do
    it "must have cells, foundations, and cascades" do
      cells = Array.new(4) { Cell.new }
      foundations = Array.new(4) { Foundation.new }
      cascades = Array.new(8) { Cascade.new }
      state = State.new(cells, foundations, cascades)
      assert_equal cells, state.cells
      assert_equal foundations, state.foundations
      assert_equal cascades, state.cascades
    end

    it "must freeze the cells, foundations, and cascades" do
      cells = Array.new(4) { Cell.new }
      foundations = Array.new(4) { Foundation.new }
      cascades = Array.new(8) { Cascade.new }
      state = State.new(cells, foundations, cascades)
      assert state.cells.frozen?, "Expected cells to be frozen"
      assert state.foundations.frozen?, "Expected foundations to be frozen"
      assert state.cascades.frozen?, "Expected cascades to be frozen"
    end
  end

  describe "when building a state" do
    it "must have 4 empty cells" do
      state = State.build(Deck.new)
      assert_equal 4, state.cells.size
      assert state.cells.all?(Cell), "Expected all elements to be of type Cell"
      assert state.cells.all?(&:empty?), "Expected all elements to be empty"
    end

    it "must have 4 empty foundations" do
      state = State.build(Deck.new)
      assert_equal 4, state.foundations.size
      assert state.foundations.all?(Foundation), "Expected all elements to be of type Foundation"
      assert state.foundations.all?(&:empty?), "Expected all elements to be empty"
    end

    it "must have 8 cascades" do
      state = State.build(Deck.new)
      assert_equal 8, state.cascades.size
      assert state.cascades.all?(Cascade), "Expected all elements to be of type Cascade"
    end

    it "must properly deal deck to cascades" do
      deck = Deck.parse(File.read("games/game1.txt"))
      state = State.build(deck)

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
    state = State.build(Deck.new)
    assert_raises(RuntimeError) { state.cells[0] = Cell.new }
    assert_raises(RuntimeError) { state.foundations[0] = Foundation.new }
    assert_raises(RuntimeError) { state.cascades[0] = Cascade.new }
  end

  it "must not allow cells, foundations, and cascades to be replaced" do
    state = State.build(Deck.new)
    assert_raises(NoMethodError) { state.cells = [Cell.new] }
    assert_raises(NoMethodError) { state.foundations = [Foundation.new] }
    assert_raises(NoMethodError) { state.cascades = [Cascade.new] }
  end

  it "must be equal to another state with the same cells, foundations, and cascades" do
    state1 = State.build(Deck.new)
    state1.foundations[0].add(state1.cascades[0].remove(1))
    state1.cells[1].add(state1.cascades[0].remove(1))

    state2 = State.build(Deck.new)
    state2.foundations[0].add(state2.cascades[0].remove(1))
    state2.cells[1].add(state2.cascades[0].remove(1))

    assert_equal state1, state2
    refute_equal state1.object_id, state2.object_id
  end

  it "must not be equal to another state with different cells, foundations, or cascades" do
    state1 = State.build(Deck.new)

    state2 = State.build(Deck.new)
    state2.cells[0].add([Card.new(1)])
    refute_equal state1, state2

    state2 = State.build(Deck.new)
    state2.foundations[0].add([Card.new(1)])
    refute_equal state1, state2

    state2 = State.build(Deck.new)
    state2.cascades[0].add([Card.new(1)])
    refute_equal state1, state2
  end
end
