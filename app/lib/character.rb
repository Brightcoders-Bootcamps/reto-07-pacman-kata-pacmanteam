# frozen_string_literal: true

# This class will be the parent class for pacman and ghost
# - This class contains velocity, position, and orientation from all characters
# 

# [1 => 'izq', 2 => 'der', 3 => 'arr', 4 => 'abj']
class Character
  attr_accessor :position, :velocity, :direction, :board
  
  def initialize(args)
    @board = args
    @position = {x: 0, y: 0}
    @velocity = 1
    @direction = 0
  end

  def calculate_movement(arg)
    ren, col = @position[:x], @position[:y]
    case @direction
    when 1 then @position[:x] += can_move?(ren - 1, col, arg) ? 1 : 0
    when 2 then @position[:x] -= can_move?(ren + 1, col, arg) ? 1 : 0
    when 3 then @position[:y] += can_move?(ren, col + 1, arg) ? 1 : 0
    when 4 then @position[:y] -= can_move?(ren, col - 1, arg) ? 1 : 0
    end
  end

  private

  def can_move?(ren, col, condition)
    (@board.board_numeric[ren][col] > condition) ? true : false 
  end
end
