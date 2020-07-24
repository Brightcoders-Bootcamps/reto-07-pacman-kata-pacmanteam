# frozen_string_literal: true
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
    attr_accessor :pacman, :ghosts, :board
    def initialize(arguments)
      @board = Board.new
      @pacman = Pacman.new(@board)
      @ghosts = Array.new()
      
    end
  
    def create_ghost
      # timer for generate new ghosts
    end
  
    def game
      # execute a infinite loop for call the printboard
      while true do
        @pacman.calcule_movement # this method will wait to command input for the user
        @ghosts.each do |ghost|
          # this method calculate the movement from the pacman position
          ghost.calcule_movement(@pacman.position) #  [x,y]
        end
        # sleep(1000)
      end
    end
	end
