# frozen_string_literal: true

require_relative 'helper_functions'

# This class most be 
#   - Print the board
#   - Send data to pacman and ghosts to calculate the next movement
# Elements :
# · -> point
# • -> power
# ● -> power
# ■ -> wall
class Board
  attr_reader :board, :board_numeric, :ghosts, :pacman

  def initialize(file)
    @pacman = nil
    @ghosts = nil
    @board = Array.new() 
    @board_numeric = Array.new()
    steam = File.open(file)
    open_file(steam.to_a)
  end

  def print_b
    @board.each_with_index do |ren, index_i|
      ren.each_with_index do |cols, index_j|
        @ghosts.map{ |ghost| cols = helper_print_b_character(ghost, cols, [index_i, index_j]) }
        cols = helper_print_b_character(@pacman, cols, [index_i, index_j])
        print cols
      end
      print "\n\r"
    end
  end

  private  

  def open_file(stream)
    stream.each_with_index do |element, pointer|
      @board_numeric << Array.new()
      @board << Array.new()
      convert_file_stream(element, pointer)
    end
  end

  def convert_file_stream(element, pointer)
    (0..element.size - 2).each do |elem|
      charac = element[elem]
      @board[pointer] << charac
      @board_numeric[pointer] << helper_find_numeric(charac, 0)
    end
  end
end