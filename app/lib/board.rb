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
  attr_accessor :board, :board_numeric

  def initialize(file)
    File.open(file, "r") do |stream|
      stream = stream.to_a
      @board = Array.new(stream.size){ Array.new() }
      @board_numeric = Array.new(stream.size){ Array.new() }
      stream.each_with_index do |element, index|
        for i in 0...(element.size - 1)
          case element[i]
          when "■" then aux = 0
          when " " then aux = 1
          when "·" then aux = 2
          when "●" then aux = 3
          end
          @board[index] << element[i]
          @board_numeric[index] << aux
        end
      end
    end
  end

  def print_b(characters)
    @board.each_with_index do |ren, index_i|
      ren.each_with_index do |cols, index_j|
        characters.each do |char|
          print ([index_i,index_j] == char[0]) ? "#{char[1]}" : "#{cols}"
        end
      end
      print "\n\r"
    end
  end
end