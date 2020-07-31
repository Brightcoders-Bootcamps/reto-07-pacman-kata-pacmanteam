# frozen_string_literal: true
require_relative "helper_exahustive_search_algorithm"

# This class calculate the movements for the ghosts
# - This class will be calculate the movements automatically

# [1 => 'izq', 2 => 'der', 3 => 'arr', 4 => 'abj']

class Ghost
  
  attr_reader :board, :character, :position, :direction, :path

  def initialize(args)
    @board = args.clone
    @position = {:x => 7, :y => 22}
    @character = "∏"
    @path = Array.new
  end

#  def calculate_movement(pacman_position)
#    # left
#    if (@position[:x] - pacman_position[:x]) >= 0
#      @direction = 1
#    # right
#    else 
#      @direction = 2
#    # top
#    end
#    if (@position[:y] - pacman_position[:y]) <= 0
#      @direction = 3
#    # bottom
#    else
#      @direction = 4
#    end
#		super(0)
#	end

  def calculate_movement(pacman_position)
    unless @path.delete_at(0)
      @path = exaustive_search(pacman_position, @position, @board)
    else
      @position = @path[0]
    end
  end

end
# ghost characters 
# ∏∩