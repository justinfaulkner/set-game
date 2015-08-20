class Board

  attr_accessor :cards

  def initialize cards
    @cards = cards
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

end