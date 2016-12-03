require 'singleton'
require 'coordinate'
require 'instruction'

# Describes the current world state with direction facing and 
# current coordinate.
class LocationState
  include Singleton

  attr_reader :direction
  attr_reader :coordinate
  attr_reader :locations

  def reset
    @direction = :north
    @coordinate = Coordinate.new(0, 0)
    @locations = ["(0,0)"]
  end

  def move(instruction)
    case instruction.direction
    when :right then turn_right
    when :left then turn_left
    end

    # This was:
    #   @coordinate.move(@direction, instruction.steps)
    # but phase 2 came up and we had to track every location we visited,
    # not just the direction changes and the last one.
    1.upto(instruction.steps) do
      @coordinate.move(@direction, 1)
      @locations << "(#{@coordinate.x_coordinate},#{@coordinate.y_coordinate})"
    end
  end

  def distance_from_start
    @coordinate.distance_from_start
  end

  protected

  def initialize
    reset
  end

  private

  def turn_right
    @direction = case @direction
                 when :north then :east
                 when :east then :south
                 when :south then :west
                 when :west then :north
                 else @direction
                 end
  end

  def turn_left
    @direction = case @direction
                 when :north then :west
                 when :west then :south
                 when :south then :east
                 when :east then :north
                 else @direction
                 end
  end
end
