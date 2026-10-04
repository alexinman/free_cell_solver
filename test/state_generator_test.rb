require "test_helper"

describe StateGenerator do
  it "should generate expected states" do
    state = State.build(Deck.new)

    states = StateGenerator.generate(state)

    assert_equal 40, states.size

    states.each do |s|
      puts StateFormatter.format(s)
    end
  end
end
