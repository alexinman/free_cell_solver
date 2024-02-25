require "test_helper"

describe Cell do
  describe "when initializing" do
    it "must have no cards" do
      cell = Cell.new
      assert_empty cell.send(:cards)
    end

    it "must not accept cards" do
      assert_raises(ArgumentError) { Cell.new([Card.new(1)]) }
    end
  end

  describe "when asking if it can add cards" do
    it "must return true if it has no cards and the cards to add is one" do
      cell = Cell.new
      assert cell.add?([Card.new(1)])
    end

    it "must return false if it has cards" do
      cell = Cell.new
      cell.add([Card.new(1)])
      refute cell.add?([Card.new(2)])
    end

    it "must return false if the cards to add is more than one" do
      cell = Cell.new
      refute cell.add?([Card.new(1), Card.new(2)])
    end
  end

  describe "when asking if it can remove cards" do
    it "must return true if it has one card and the number to remove is one" do
      cell = Cell.new
      cell.add([Card.new(1)])
      assert cell.remove?(1)
    end

    it "must return false if it has no cards" do
      cell = Cell.new
      refute cell.remove?(1)
    end

    it "must return false if the number to remove is more than one" do
      cell = Cell.new
      cell.add([Card.new(1)])
      refute cell.remove?(2)
    end
  end
end
