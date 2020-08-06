# frozen_string_literal: true

# This class calculate the movements for the ghosts
# - This class will be calculate the movements automatically

# [1 => 'izq', 2 => 'der', 3 => 'arr', 4 => 'abj']

class Ghost < Character
  
  attr_reader :path

  def initialize(args, posibilities)
    super(args, posibilities)
    @position = {:x => 7, :y => 22}
    @character = "∏"
    @path = Array.new
  end

  def calculate_movement(pacman_position)
    (@path = Search.new(@position, pacman_position, @posibilities).exaustive_search(@board)) unless @path.delete_at(0)
    position = @path[0]
    @position = (!position) ? position : position
  end

end
# ghost characters 
# ∏∩