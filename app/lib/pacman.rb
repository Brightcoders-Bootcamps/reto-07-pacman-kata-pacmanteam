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
    @position[:x] = 14
    @position[:y] = 2
    @direction = 1
    @character = "<"
  end

  def calculate_movement
    @character = toogle_character
  	super(1)  	
  end

  private 

  def toogle_character
    case @direction
    when 1 then ('∨' == @character) ? '|' : '∨'
    when 2 then ('∧' == @character) ? '|' : '∧'
    when 3 then ('<' == @character) ? '-' : '<'
    when 4 then ('>' == @character) ? '-' : '>'
    end
  end
end
