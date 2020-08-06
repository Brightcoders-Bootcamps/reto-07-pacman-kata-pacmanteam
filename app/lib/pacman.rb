# frozen_string_literal: true



# This class will be capture the commands for movement from the user
# - Most be contains a function to capture the commands from the user
# - Calculate the movement for pacman

# [1 => 'izq', 2 => 'der', 3 => 'arr', 4 => 'abj']
# pacman characters
# <>∨∧
class Pacman < Character

  def initialize(args, posibilities)
    super(args, posibilities)
    @direction = 1
    @position = {x: 14, y: 4}
    @character = "<"
    @characters = ['∨', '∧', '<', '>']
  end

  def calculate_movement
    elem = @direction - 1
    @position, @character = check_element(@characters[elem], @posibilities[elem])
  end

  def capture_direction
    # this method must be executed in a thread for capture
    # the direction for pacman
    capture_value = STDIN.getch
    @direction = helper_find_numeric(capture_value, @direction)
    return ((capture_value == "\r") || (capture_value == "\n")) ? nil : capture_direction
  end

  private 
  def check_element(charac, sum)
    ren, col, caracter = @position[:x] + sum[:x], @position[:y] + sum[:y]
    character = (charac == @character) ? '-' : charac
    return board.can_move?(ren, col, 1) ? { :x => ren, :y => col} : @position, character
  end
end
