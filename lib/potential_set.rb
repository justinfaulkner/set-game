class PotentialSet

  attr_accessor :cards

  def initialize card_1, card_2, card_3
    @cards = Set.new [card_1, card_2, card_3]
  end

  def is_set?
    valid = true
    Card::PROPERTIES.each do |property_name|
      valid = validate_property property_name
      break unless valid
    end
    valid
  end

  def validate_property property
    variation_set = variations_for_property property
    variation_count = variation_set.count
    variation_count == 1 || variation_count == 3
  end

  def variations_for_property property
    variations = Set.new
    @cards.each do |card|
      variations << card.send(property)
    end
    variations
  end


end