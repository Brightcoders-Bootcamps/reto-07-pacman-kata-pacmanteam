# frozen_string_literal: true
require_relative "character"

# This class will be capture the commands for movement from the user
# - Most be contains a function to capture the commands from the user
# - Calculate the movement for pacman

# [1 => 'izq', 2 => 'der', 3 => 'arr', 4 => 'abj']
# pacman characters
# <>∨∧
class Pacman < Character
    def initialize(args)
      # parent.initialize(args)
    end
  
    def capture_direction
      # this method must be executed in a thread for capture
      # the direction for pacman 
      while 1 do
        aux = gets.chomp
        if aux = 
        
      end
    end
  
    def calculate_movement
      # depending for the direction defined by the user, this
      # method must be calculate the direction from the board
    end
  end
