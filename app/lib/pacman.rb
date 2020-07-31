# frozen_string_literal: true
require_relative "helper_functions"
# This class will be capture the commands for movement from the user
# - Most be contains a function to capture the commands from the user
# - Calculate the movement for pacman

# [1 => 'izq', 2 => 'der', 3 => 'arr', 4 => 'abj']
# pacman characters
# <>∨∧
class Pacman

  attr_accessor :direction
  attr_reader :board, :character, :position

  def initialize(args)
    @board = args.clone
    @direction = 1
    @position = {x: 14, y: 4}
    @character = "<"
  end

  def calculate_movement
    case @direction
    when 1 then @position[:x] += check_ren('∨', - 1)
    when 2 then @position[:x] += check_ren('∧', + 1)
    when 3 then @position[:y] += check_col('<', + 1)
    when 4 then @position[:y] += check_col('>', - 1)
    end
  end

  def capture_direction
    # this method must be executed in a thread for capture
    # the direction for pacman
    capture_value = STDIN.getch
    @direction = helper_find_numeric(capture_value, @direction)
    return ((capture_value == "\r") || (capture_value == "\n")) ? nil : capture_direction
  end

  private

  def check_ren(charac, val)
    ren, col = @position[:x], @position[:y]
    @character = (charac == @character) ? '|' : charac
    return board.can_move?(ren + val, col, 1) ? val : 0
  end

  def check_col(charac, val)
    ren, col = @position[:x], @position[:y]
    @character = (charac == @character) ? '-' : charac
    return board.can_move?(ren, col + val, 1) ? val : 0
  end
end
