# frozen_string_literal: true
require_relative "character"
require_relative "helper_functions"
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
    @direction = 1
    @character = "<"
  end

  def calculate_movement
    @character = case @direction
    when 3 then "<"
    when 4 then ">"
    when 1 then "∨"
    when 2 then "∧"
    end
  	super(1)  	
  end
end
