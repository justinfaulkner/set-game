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

    def property_values_for property_name
      case property_name
        when :color
          self::COLORS
        when :shape
          self::SHAPES
        when :shading
          self::SHADINGS
        when :number
          self::NUMBERS
      end
    end

    def other_value_for property_name, first_property, second_property
      all_values = self.property_values_for property_name
      all_values.delete(first_property)
      all_values.delete(second_property)
      all_values.first
    end
  end

  def initialize(color, shape, shading, number)
    @color = color
    @shape = shape
    @shading = shading
    @number = number
  end

  def to_s
    "#{@color} #{@shape} #{@shading} #{@number}"
  end


end
