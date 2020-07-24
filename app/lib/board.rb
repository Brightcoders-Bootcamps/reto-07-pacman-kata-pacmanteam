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
  attr_reader :board

  def initialize(file)
    File.open(file, "r") do |stream|
      stream = stream.to_a
      @board = Array.new(stream.size){ Array.new() }
      stream.each_with_index do |e, index|
        for i in 0...(e.size - 1)
          @board[index] << e[i]
        end
      end
    end
    return nil
  end

  def print_b
    @board.each do |ren|
      ren.each do |cols|
        print "#{cols}"
      end
      print "\n"
    end
    nil
  end
end