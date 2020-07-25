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
    super(args)
    @position[:x] = 21
    @position[:y] = 2
  end

  def calculate_movement
  	super(1)  	
  end
end
