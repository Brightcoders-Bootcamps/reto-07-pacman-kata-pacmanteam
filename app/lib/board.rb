# frozen_string_literal: true

require_relative 'helper_open_stream'

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

  def initialize(file)
    @board = Array.new() 
    @board_numeric = Array.new()
    steam = File.open(file)
    open_file(steam.to_a, @board, @board_numeric)
  end

  def print_b(ghosts, pacman)
    system("clear")
    @board.each_with_index do |ren, index_i|
      ren.each_with_index do |cols, index_j|
        ghosts.map{ |ghost| cols = helper_print_b_character(ghost, cols, [index_i, index_j]) }
        cols = helper_print_b_character(pacman, cols, [index_i, index_j])
        print cols
      end
      print "\n\r"
    end
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