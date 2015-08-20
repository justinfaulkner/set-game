require 'test_helper'

describe Card do
  describe 'on creation' do
    it 'should have attributes' do
      card = Card.new_random
      Card::COLORS.must_include card.color
      Card::SHAPES.must_include card.shape
      Card::SHADINGS.must_include card.shading
      Card::NUMBERS.must_include card.number
    end
  end

  describe :other_value_for do
    it "should find other color" do
      other_value = Card.other_value_for :color, Card::COLOR_RED, Card::COLOR_PURPLE
      other_value.must_equal Card::COLOR_GREEN
    end

    it "should find other number" do
      other_value = Card.other_value_for :number, 2, 3
      other_value.must_equal 1
    end
  end
end
