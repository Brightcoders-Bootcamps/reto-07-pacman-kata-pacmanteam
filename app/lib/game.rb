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

class Game < Board

  def initialize(arguments)
    super(arguments)
    @pacman = Pacman.new(@board_numeric)
    @ghosts = Array.new()
  end

  def ghost_appear
    while true do
      if @ghosts.size < 6
        @ghosts << Ghost.new(@board_numeric)
      end
      sleep(5)
    end
  end

  def capture_direction
    # this method must be executed in a thread for capture
    # the direction for pacman
    capture_value = STDIN.getch
    
    @pacman.direction = helper_find_numeric(capture_value, @pacman.direction)
    
    return nil if (capture_value == "\r") || (capture_value == "\n")
    return capture_direction
  end

  def characters_behavior
    @pacman.calculate_movement # this method will wait to command input for the user
    @ghosts.each do |ghost|
      ghost.calculate_movement(@pacman.position)
    end
  end

  def game
    # execute a infinite loop for call the printboard
    while true do
      system("clear")
      characters_behavior
      print_b
      sleep(0.06)
    end
  end
end
