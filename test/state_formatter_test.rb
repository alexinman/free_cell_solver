require "test_helper"

describe StateFormatter do
  it "must return a human readable string representing the state" do
    state = State.build(Deck.new)

    state.cells[0].add(state.cascades[0].remove(1))
    state.cells[2].add(state.cascades[1].remove(1))
    state.cascades[3].add(state.cascades[4].remove(1))
    state.cascades[3].add(state.cascades[1].remove(1))
    state.cascades[3].add(state.cascades[4].remove(1))
    state.cascades[3].add(state.cascades[1].remove(1))
    state.cascades[3].add(state.cascades[4].remove(1))
    state.cascades[3].add(state.cascades[1].remove(1))
    state.cascades[3].add(state.cascades[4].remove(1))
    state.cascades[3].add(state.cascades[1].remove(1))
    state.cascades[3].add(state.cascades[4].remove(1))
    state.cascades[3].add(state.cascades[1].remove(1))
    state.cascades[3].add(state.cascades[4].remove(1))
    state.foundations[1].add(state.cascades[1].remove(1))

    state.cascades[2].add(state.cascades[5].remove(1))
    state.cascades[2].add(state.cascades[0].remove(1))
    state.cascades[2].add(state.cascades[5].remove(1))
    state.cascades[2].add(state.cascades[0].remove(1))
    state.cascades[2].add(state.cascades[5].remove(1))
    state.cascades[2].add(state.cascades[0].remove(1))
    state.cascades[2].add(state.cascades[5].remove(1))
    state.cascades[2].add(state.cascades[0].remove(1))
    state.cascades[2].add(state.cascades[5].remove(1))
    state.foundations[1].add(state.cascades[5].remove(1))

    assert_equal <<~EXPECTED, StateFormatter.format(state)
      ════════════════════════════════
           2♣          K♥      K♣

       A♥      A♦  A♠          2♦  2♠
       3♥      3♦  3♠          4♦  4♠
               5♦  5♠          6♦  6♠
               7♦  7♠          8♦  8♠
               9♦  9♠         10♦ 10♠
               J♦  J♠          Q♦  Q♠
               K♦  K♠
               Q♣  Q♥
               J♥  J♣
              10♣ 10♥
               9♥  9♣
               8♣  8♥
               7♥  7♣
               6♣  6♥
               5♥  5♣
               4♣  4♥
                   3♣
                   2♥

      ════════════════════════════════
    EXPECTED
  end
end
