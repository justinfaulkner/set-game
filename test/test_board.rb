require 'test_helper'

describe Board do
  describe :first_deal do
    it "should deal 12 cards" do
      new_board = Board.first_deal
      count = new_board.cards.count
      count.must_equal 12
    end
  end

  describe :existing_board do
    let(:card_1) { Card.new(Card::COLOR_RED, Card::SHAPE_DIAMOND, Card::SHADING_SOLID, 1) }
    let(:card_2) { Card.new(Card::COLOR_GREEN, Card::SHAPE_SQUIGGLE, Card::SHADING_STRIPED, 2) }
    let(:card_3) { Card.new(Card::COLOR_PURPLE, Card::SHAPE_OVAL, Card::SHADING_EMPTY, 3) }
    let(:card_4) { Card.new(Card::COLOR_PURPLE, Card::SHAPE_OVAL, Card::SHADING_SOLID, 3) }

    let(:board) { Board.new [card_1, card_2, card_3, card_4].to_set }

    describe :find_set do
      # it "should find the set" do
      #   set = board.find_set
      #   set.must_equal [card_1, card_2, card_3].to_set
      # end
    end

    describe :add_card_to_property_map do
      it "should index card by all its properties" do
        board.add_card_to_property_map card_1

        board.property_map[Card::COLOR_RED].must_include card_1, 'should index by color'
        board.property_map[Card::SHAPE_DIAMOND].must_include card_1, 'should index by shape'
        board.property_map[Card::SHADING_SOLID].must_include card_1, 'should index by shading'
        board.property_map[1].must_include card_1, 'should index by number'

        board.property_map[Card::COLOR_GREEN].wont_include card_1, 'should not incorrectly index color'
        board.property_map[2].wont_include card_1, 'should not incorrectly index number'
      end
    end
  end

end