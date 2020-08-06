# frozen_string_literal: true

# This class is a core
# - Contains pacman, ghost and board
# - Send the data from board to ghost and pacman
# - Send the pacman and ghost position to board for print it
# - Create a new ghosts
# - if pacman colision with a ghost, is the game over

class Game 
  attr :stage, :pacman

  def initialize
    @posibilites = [{:x => -1, :y => 0}, {:x => 1, :y => 0}, {:x => 0, :y => 1},{:x => 0, :y => -1}]
    @board = Board.new
    @pacman = Pacman.new(@board, @posibilites)
    @ghosts = Array.new()
  end

  def ghost_appear
    while true do
      if @ghosts.size < 6
        @ghosts << Ghost.new(@board, @posibilites)
      end
      sleep(8)
    end
  end

  def game
    # execute a infinite loop for call the printboard
    points = 0
    level = 1
    velocity = 0.5
    loop do
      level, velocity, @board = level_up(level, velocity)
      @pacman.calculate_movement
      @ghosts.map { |ghost| ghost.calculate_movement(@pacman.position)}
      print_b(@ghosts, @pacman, @board.board)
      points += @board.calculate_points(@pacman.position)
      print "Points: #{points}, level: #{level}\n\rpress enter to exit...\n\r"
      sleep(velocity)
    end
  end

  private
  def level_up(level, velocity)
    flag = false
    @board.board_numeric.map { |element| (flag = true) if (element.include?(3) || element.include?(4)) }
    (return level + 1, velocity - 0.02, Board.new) unless flag
    return level, velocity, @board
  end
end
