class Card

  attr_accessor :color, :shape, :shading, :number

  COLOR_RED = :red
  COLOR_GREEN = :green
  COLOR_PURPLE = :purple

  SHAPE_DIAMOND = :diamond
  SHAPE_SQUIGGLE = :squiggle
  SHAPE_OVAL = :oval

  SHADING_SOLID = :solid
  SHADING_EMPTY = :empty
  SHADING_STRIPED = :striped

  COLORS = [COLOR_RED, COLOR_GREEN, COLOR_PURPLE]
  SHAPES = [SHAPE_DIAMOND, SHAPE_SQUIGGLE, SHAPE_OVAL]
  SHADINGS = [SHADING_SOLID, SHADING_EMPTY, SHADING_STRIPED]
  NUMBERS = [1, 2, 3]

  class << self
    def new_random
      new(COLORS.sample, SHAPES.sample, SHADINGS.sample, NUMBERS.sample)
    end
  end

  def initialize(color, shape, shading, number)
    self.color = color
    self.shape = shape
    self.shading = shading
    self.number = number
  end

end
