class Direction
  # attr_accessor :UP, :DOWN, :LEFT, :RIGHT
  #      ^         y == 0
  #      3         y == 1
  # <- 2   0 ->    y == 2
  #      1
  #      \/
  RIGHT = 0
  DOWN = 1
  LEFT = 2
  UP = 3

  def self.turn_right(direction)
    (direction + 1) % 4
  end

  def self.turn_left(direction)
    (direction - 1) % 4
  end

  def self.print(direction)
    case direction
      when Direction::RIGHT
        'RIGHT'
      when Direction::UP
        'UP'
      when Direction::DOWN
        'DOWN'
      when Direction::LEFT
        'LEFT'
      else
        "UNKNOWN: #{direction}"
    end
  end
end

class Point
  attr_accessor :x, :y

  def initialize(x,y)
    @x = x
    @y = y
  end

  def move(direction, distance)
    case direction
      when Direction::RIGHT
        Point.new x + distance, y
      when Direction::DOWN
        Point.new x, y + distance
      when Direction::LEFT
        Point.new x - distance, y
      when Direction::UP
        Point.new x, y - distance
      else
        puts "UNKNOWN DIRECTION: #{direction}"
        exit 1
    end
  end

  def to_s
    "(#{@x},#{@y})"
  end

  def ==(other)
    other.x == @x && other.y == @y
  end
end

class State
  attr_accessor :direction, :position

  def initialize
    @direction = Direction::UP
    @position = Point.new 0, 0
  end

  def to_s
    "#{Direction.print @direction} #{@position}"
  end
end

class Instruction
  RIGHT = 1
  LEFT = -1

  def initialize(input)
    @direction = (input[0] == 'R' ? RIGHT : LEFT)
    @distance = input[1..-1].to_i
  end

  def apply(state)
    state.direction = turn state.direction
    state.position = state.position.move(state.direction, @distance)
    state
  end

  def turn(direction)
    (direction + @direction) % 4
  end

  def to_s
    "#{@direction == RIGHT ? 'R' : 'L'}#{@distance}"
  end
end

class Walker
  def initialize(input)
    @instructions = input.split(/,/).map{|l| Instruction.new(l.chomp.strip)}
    @destination = @instructions.inject(State.new){|state,instruction| instruction.apply(state)}.position
  end

  def distance
    @destination.x.abs + @destination.y.abs
  end
end