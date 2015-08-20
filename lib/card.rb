class Card

  attr_accessor :color, :shape, :shading, :number

  PROPERTIES = [:color, :shape, :shading, :number]

  COLOR_RED = :R
  COLOR_GREEN = :G
  COLOR_PURPLE = :P

  SHAPE_DIAMOND = :DI
  SHAPE_SQUIGGLE = :SQ
  SHAPE_OVAL = :OV

  SHADING_SOLID = :SOL
  SHADING_EMPTY = :EMP
  SHADING_STRIPED = :STR

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

  def to_s
    "#{self.color} #{self.shape} #{self.shading} #{self.number}"
  end
end
