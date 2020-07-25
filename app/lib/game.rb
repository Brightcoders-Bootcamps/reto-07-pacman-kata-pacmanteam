# frozen_string_literal: true
require "io/console"
require_relative "pacman"
require_relative "ghost"
require_relative "board"

# This class is a core
# - Contains pacman, ghost and board
# - Send the data from board to ghost and pacman
# - Send the pacman and ghost position to board for print it
# - Create a new ghosts
# - if pacman colision with a ghost, is the game over

class Game
  attr_reader :pacman, :ghosts, :board

  def initialize(arguments)
    @board = Board.new(arguments)
    @pacman = Pacman.new(@board)
    @ghosts = Array.new()
  end

  def ghost_appear
    while true do
      if @ghosts.size < 6
        @ghosts << Ghost.new(@board)
      end
      sleep(5)
    end
  end

  def capture_direction
    # this method must be executed in a thread for capture
    # the direction for pacman 
    while true do
      aux = STDIN.getc
      @pacman.direction = case aux
      when "w" then 3 # up
      when "a" then 1 # left
      when "s" then 4 # down
      when "d" then 2 # right
      end
    end
  end

  def characters_behavior
    # timer for generate new ghosts
    return_value = Array.new
    @pacman.calculate_movement # this method will wait to command input for the user
    return_value << [[@pacman.position[:x], @pacman.position[:y]], '<']
    @ghosts.each do |ghost|
      ghost.calculate_movement(@pacman.position)
      return_value << [[ghost.position[:x], ghost.position[:y]], '∏']
    end
    return_value
  end

  def game
    # execute a infinite loop for call the printboard
    while true do
      system("clear")
      @board.print_b(characters_behavior)
      sleep(0.09)
    end
  end
end
