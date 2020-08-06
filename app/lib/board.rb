# frozen_string_literal: true

# This class most be 
#   - Print the board
#   - Send data to pacman and ghosts to calculate the next movement
# Elements :
# · -> point
# • -> power
# ● -> power
# ■ -> wall
class Board
  attr :board, :board_numeric

  def initialize
    @board = Array.new() 
    @board_numeric = Array.new()
    stream = File.open(ENV["PWD"] + "/app/stage1.txt").to_a
    @board = stream.map{ |element| element.split(//) }
    @board_numeric = @board.map { |element| element.map{ |element| helper_find_numeric(element, 0) }}
  end

  def can_move?(ren, col, condition)
    return (@board_numeric[ren][col] > condition) ? true : false 
  end

  def calculate_points(pacman)
    pac_x, pac_y = pacman[:x], pacman[:y]
    if can_move?(pac_x, pac_y, 2)
      @board[pac_x][pac_y] = " "
      @board_numeric[pac_x][pac_y] = 2
      return 1
    end
    return 0
  end

end