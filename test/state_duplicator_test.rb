require "test_helper"

describe StateDuplicator do
  it "duplicates a state" do
    state = State.build(Deck.new.shuffle)

    state2 = StateDuplicator.dup(state)

    assert_equal state, state2
    refute_equal state.object_id, state2.object_id
  end

  describe "when adding cards to a duplicate cell" do
    it "must not modify the original" do
      state = State.build(Deck.new.shuffle)
      state2 = StateDuplicator.dup(state)

      state2.cells.first.add([Card.new(1)])

      assert_empty state.cells.first
    end
  end

  describe "when adding cards to a duplicate cascade" do
    it "must not modify the original" do
      state = State.build(Deck.new.shuffle)
      state2 = StateDuplicator.dup(state)

      state2.cascades.first.add([Card.new(1)])

      assert_equal 7, state.cascades.first.cards.size
    end
  end

  describe "when adding cards to a duplicate foundation" do
    it "must not modify the original" do
      state = State.build(Deck.new.shuffle)
      state2 = StateDuplicator.dup(state)

      state2.foundations.first.add([Card.new(1)])

      assert_empty state.foundations.first
    end
  end

  describe "when adding cards to an original cell" do
    it "must not modify the duplicate" do
      state = State.build(Deck.new.shuffle)
      state2 = StateDuplicator.dup(state)

      state.cells.first.add([Card.new(1)])

      assert_empty state2.cells.first
    end
  end

  describe "when adding cards to an original cascade" do
    it "must not modify the duplicate" do
      state = State.build(Deck.new.shuffle)
      state2 = StateDuplicator.dup(state)

      state.cascades.first.add([Card.new(1)])

      assert_equal 7, state2.cascades.first.cards.size
    end
  end

  describe "when adding cards to an original foundation" do
    it "must not modify the duplicate" do
      state = State.build(Deck.new.shuffle)
      state2 = StateDuplicator.dup(state)

      state.foundations.first.add([Card.new(1)])

      assert_empty state2.foundations.first
    end
  end

  describe "when removing cards from a duplicate cell" do
    it "must not modify the original" do
      state = State.build(Deck.new.shuffle)
      state.cells.first.add([Card.new(1)])
      state2 = StateDuplicator.dup(state)

      state2.cells.first.remove(1)

      assert_equal 1, state.cells.first.cards.size
    end
  end

  describe "when removing cards from a duplicate cascade" do
    it "must not modify the original" do
      state = State.build(Deck.new.shuffle)
      state2 = StateDuplicator.dup(state)

      state2.cascades.first.remove(1)

      assert_equal 7, state.cascades.first.cards.size
    end
  end

  describe "when removing cards from a duplicate foundation" do
    it "must not modify the original" do
      state = State.build(Deck.new.shuffle)
      state.foundations.first.add([Card.new(1)])
      state2 = StateDuplicator.dup(state)

      state2.foundations.first.remove(1)

      assert_equal 1, state.foundations.first.cards.size
    end
  end

  describe "when removing cards from an original cell" do
    it "must not modify the duplicate" do
      state = State.build(Deck.new.shuffle)
      state.cells.first.add([Card.new(1)])
      state2 = StateDuplicator.dup(state)

      state.cells.first.remove(1)

      assert_equal 1, state2.cells.first.cards.size
    end
  end

  describe "when removing cards from an original cascade" do
    it "must not modify the duplicate" do
      state = State.build(Deck.new.shuffle)
      state2 = StateDuplicator.dup(state)

      state.cascades.first.remove(1)

      assert_equal 7, state2.cascades.first.cards.size
    end
  end

  describe "when removing cards from an original foundation" do
    it "must not modify the duplicate" do
      state = State.build(Deck.new.shuffle)
      state.foundations.first.add([Card.new(1)])
      state2 = StateDuplicator.dup(state)

      state.foundations.first.remove(1)

      assert_equal 1, state2.foundations.first.cards.size
    end
  end
end
