# frozen_string_literal: true

require_relative "character"

# This class calculate the movements for the ghosts
# - This class will be calculate the movements automatically

# [1 => 'izq', 2 => 'der', 3 => 'arr', 4 => 'abj']

class Ghost < Character

  def initialize(args)
    super(args)
    @position[:x] = 11
    @position[:y] = 39
  end

  def calculate_movement(pacman_position)
    # left
    if (@position[:x] - pacman_position[:x]) >= 0
      @direction = 1
    # right
    elsif (@position[:x] - pacman_position[:x]) <= 0
      @direction = 2
    # top
    elsif (@position[:y] - pacman_position[:y]) <= 0
      @direction = 3
    # bottom
    else
      @direction = 4
    end

		super(0)
	end
end
# ghost characters 
# ∏∩