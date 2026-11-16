require "test_helper"

describe StateDuplicator do
  it "duplicates a state" do
    state = State.build(Deck.new.shuffle)

    state2 = StateDuplicator.dup(state)

    assert_equal state, state2
    refute_equal state.object_id, state2.object_id
  end

  describe "when modifying the duplicate" do
    it "must not modify the original" do
      state = State.build(Deck.new.shuffle)
      state2 = StateDuplicator.dup(state)

      state2.cells[0].add(state2.cascades[0].remove(1))
      state2.foundations[1].add(state2.cascades[3].remove(1))

      assert_empty state.cells[0].cards
      assert_empty state.foundations[1].cards
      assert_equal 7, state.cascades[0].cards.size
      assert_equal 7, state.cascades[3].cards.size
    end
  end
end
