require 'test_helper'

describe PotentialSet do
  let(:card_1) { Card.new(Card::COLOR_RED, Card::SHAPE_DIAMOND, Card::SHADING_SOLID, 1) }
  let(:card_2) { Card.new(Card::COLOR_GREEN, Card::SHAPE_SQUIGGLE, Card::SHADING_STRIPED, 2) }
  let(:card_3) { Card.new(Card::COLOR_PURPLE, Card::SHAPE_OVAL, Card::SHADING_EMPTY, 3) }

  describe :is_set? do
    it "should recognize a set with all attributes different" do
      PotentialSet.new(card_1, card_2, card_3).is_set?.must_equal true
    end

    it "should recognize a set by color same" do
      card_2.color = card_3.color = Card::COLOR_RED
      PotentialSet.new(card_1, card_2, card_3).is_set?.must_equal true
    end

    it "should recognize a set by number same" do
      card_1.number = card_3.number = 2
      PotentialSet.new(card_1, card_2, card_3).is_set?.must_equal true
    end

    it "should recognize a non-set" do
      card_2.color = Card::COLOR_RED
      PotentialSet.new(card_1, card_2, card_3).is_set?.must_equal false
    end
  end

  describe :validate_property do
    it "should reject a property if 2 of 3 are the same" do
      card_2.color = Card::COLOR_RED
      PotentialSet.new(card_1, card_2, card_3).validate_property(:color).must_equal false
    end
  end
end