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
end
