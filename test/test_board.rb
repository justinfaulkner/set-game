require 'test_helper'

describe Board do
  describe :first_deal do
    it "should deal 12 cards" do
      board = Board.first_deal
      count = board.cards.count
      count.must_equal 12
    end
  end
end