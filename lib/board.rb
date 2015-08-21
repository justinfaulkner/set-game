class Board

  attr_accessor :cards, :property_map

  def initialize cards
    @cards = cards
    @property_map = Hash.new { |h, k| h[k] = Set.new }
  end

  class << self
    def first_deal
      cards = Set.new
      12.times { cards << Card.new_random }
      new cards
    end
  end

  def to_s
    @cards.map(&:to_s).join("\n")
  end

  def find_set
    set = nil
    @cards.each do |card|
      set = find_set_for_card card
      break unless set.nil?
    end
    remove_set_from_property_map set unless set.nil?
    set
  end

  def find_set_for_card card
    @cards.each do |second_card|
      debugger
      next if second_card == card
      debugger
      third_card = find_matching_third_card card, second_card
      return Set.new [card, second_card, third_card] unless third_card.nil?
    end
    nil
  end

  def find_matching_third_card first, second
    matches = @cards
    Card::PROPERTIES.each do |property_name|
      matches = find_third_card_for_property(property_name, matches, first, second)
    end
    matches.first unless matches.empty?
  end

  def find_third_card_for_property(property_name, matches, first, second)
    first_property = first.send(property_name)
    second_property = second.send(property_name)
    same = first_property == second_property
    if same
      matches = matches & matches_for_property(first_property)
    else
      matches = matches & antimatches_for_property(property_name, first_property, second_property)
    end
    matches
  end

  def matches_for_property property_value
    @property_map[property_value]
  end

  def antimatches_for_property(property_name, first_property, second_property)
    other_property = Card.other_value_for property_name, first_property, second_property
    matches_for_property other_property
  end

  def build_property_map
    @cards.each do |card|
      add_card_to_property_map card
    end
  end

  def add_card_to_property_map card
    Card::PROPERTIES.each do |property_name|
      card_property = card.send(property_name)
      @property_map[card_property] << card
    end
  end

  def remove_card_from_property_map card
    Card::PROPERTIES.each do |property_name|
      card_property = card.send(property_name)
      @property_map[card_property].delete card
    end
  end

  def remove_set_from_property_map set
    set.each do |card|
      remove_card_from_property_map card
    end
  end
end