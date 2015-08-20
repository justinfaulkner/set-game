class PotentialSet

  attr_accessor :cards

  def initialize card_1, card_2, card_3
    @cards = Set.new [card_1, card_2, card_3]
  end

  def is_set?
    valid = true
    Card::PROPERTIES.each do |property|
      valid = validate_property property
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
    @cards.map(&property).to_set
  end


end