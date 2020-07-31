# frozen_string_literal: true

require_relative "character"
require_relative "helper_functions"

# This class calculate the movements for the ghosts
# - This class will be calculate the movements automatically

# [1 => 'izq', 2 => 'der', 3 => 'arr', 4 => 'abj']

class Ghost < Character
  attr :path
  def initialize(args)
    super(args)
    @position[:x] = 7
    @position[:y] = 22
    @character = "∏"
    @path = Array.new
  end

#  def calculate_movement(pacman_position)
#    # left
#    if (@position[:x] - pacman_position[:x]) >= 0
#      @direction = 1
#    # right
#    else 
#      @direction = 2
#    # top
#    end
#    if (@position[:y] - pacman_position[:y]) <= 0
#      @direction = 3
#    # bottom
#    else
#      @direction = 4
#    end
#		super(0)
#	end

  def calculate_movement(pacman_position)
    if @path.size == 0
      @path = exaustive_search(pacman_position, @position)
      @path = @path[0..20]
    else
      @position = @path[0]
      @path.delete_at(0)
    end
  end

  private 

  def exaustive_search(goal, position)
    # => This method is a A* algorith
    # => The array contais [ [position], [posibilities]]
    # => Posibilities can be [1,2,3,4]
    # => 0 => Dont move
    # => 1 => up
    # => 2 => down
    # => 3 => right 
    # => 4 => left
    # if return in array, delete a posibilities
    posibilities = Array.new
    movements = [position.clone]
    flag = false
    loop do
      unless flag
        ren, col = movements.last[:x], movements.last[:y]
        posibilities << { :x => ren - 1, :y => col } if can_move?(ren - 1, col, 0)
        posibilities << { :x => ren + 1, :y => col } if can_move?(ren + 1, col, 0)
        posibilities << { :x => ren, :y => col + 1 } if can_move?(ren, col + 1, 0)
        posibilities << { :x => ren, :y => col - 1 } if can_move?(ren, col - 1, 0)
      end

      posibility = posibilities.pop
      flag = movements.include?(posibility)
      posibilities.delete(posibility)
      (movements << posibility.clone) unless movements.include?(posibility)

      next if flag
      break if posibilities.size < 2
      break if posibility == goal
      break if movements.size > 100
    end
    return movements
  end
end
# ghost characters 
# ∏∩