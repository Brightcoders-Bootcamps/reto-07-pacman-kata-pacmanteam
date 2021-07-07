# frozen_string_literal: true

# This class will be the parent class for pacman and ghost
# - This class contains velocity, position, and orientation from all characters
# 

# [1 => 'izq', 2 => 'der', 3 => 'arr', 4 => 'abj']
class Character
    attr_accessor :position, :velocity, :direction, :board
    
    def initialize(args)
      @position = Array.new(2){ |0| }
      @velocity = 1
      @direction = 0
    end
  
  end
