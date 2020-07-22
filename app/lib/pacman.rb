# frozen_string_literal: true

# This class will be capture the commands for movement from the user
# - Most be contains a function to capture the commands from the user
# - Calculate the movement for pacman

# [1 => 'izq', 2 => 'der', 3 => 'arr', 4 => 'abj']

class Pacman << Character
    def initialize(args)
      # parent.initialize(args)
    end
  
    def capture_direction
      # this method must be executed in a thread for capture
      # the direction for pacman 
    end
  
    def calculate_movement
      # depending for the direction defined by the user, this
      # method must be calculate the direction from the board
    end
  end
