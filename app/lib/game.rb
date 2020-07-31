# frozen_string_literal: true
require "io/console"
require_relative "pacman"
require_relative "ghost"
require_relative "board"
require_relative "helper_functions"
# This class is a core
# - Contains pacman, ghost and board
# - Send the data from board to ghost and pacman
# - Send the pacman and ghost position to board for print it
# - Create a new ghosts
# - if pacman colision with a ghost, is the game over

class Game 
  attr :stage, :pacman

  def initialize(arguments)
    @stage = arguments
    @board = Board.new(arguments)
    @pacman = Pacman.new(@board)
    @ghosts = Array.new()
  end

  def ghost_appear
    while true do
      if @ghosts.size < 6
        @ghosts << Ghost.new(@board)
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
      level, velocity = level_up(level, velocity)
      pacman, position = @pacman, @pacman.position
      pacman.calculate_movement # this method will wait to command input for the user
      @ghosts.map{ |ghost| ghost.calculate_movement(position)}
      @board.print_b(@ghosts, pacman)
      points += @board.calculate_points(position)
      print "Points: #{points}, level: #{level}\n\rpress enter to exit...\n\r"
      sleep(velocity)
    end
  end

  private

  def level_up(level, velocity)
    flag = false
    @board.board_numeric.map { |element| (flag = true) if (element.include?(3) || element.include?(4)) }
    unless flag
      @board = Board.new(@stage)
      return level + 1, velocity - 0.02
    end
    return level, velocity
  end
end
