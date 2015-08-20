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
    build_property_map
  end

  def build_property_map
    @cards.each do |card|
      add_card_to_property_map card
    end
  end

  def add_card_to_property_map card
    Card::PROPERTIES.each do |property|
      card_property = card.send(property)
      @property_map[card_property] << card
    end
  end
end