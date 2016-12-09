# Defines a location on the map.
#
# Coordinate(0,0) is defined as the starting location.
class Coordinate
  attr_reader :x_coordinate
  attr_reader :y_coordinate

  def initialize(x_coord = 0, y_coord = 0)
    @x_coordinate = x_coord
    @y_coordinate = y_coord
  end

  def move(direction, steps)
    case direction
    when :north then @y_coordinate += steps
    when :south then @y_coordinate -= steps
    when :east  then @x_coordinate += steps
    when :west  then @x_coordinate -= steps
    end
  end

  def distance_from_start
    @coordinate.x_coordinate.abs + @coordinate.y_coordinate.abs
  end
end
