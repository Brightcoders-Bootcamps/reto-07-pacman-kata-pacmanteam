# frozen_string_literal: true

# => This method is a A* algorith
# => The array contais [ [position], [posibilities]]
# => Posibilities can be [1,2,3,4]
# => 0 => Dont move
# => 1 => up
# => 2 => down
# => 3 => right 
# => 4 => left
# if return in array, delete a posibilities

class Search
  attr :posibilities, :movements, :goal

  def initialize(position, goal, posibilities)
    @posibilities = Array.new
    @goal = goal
    @check_posibilities = posibilities
    @movements = [position.clone]
  end

  def exaustive_search(board)
    
    flag = false
    loop do
      unless flag
        @check_posibilities.map {|element| @posibilities << check_movement(@movements.last, element, board)}
        @posibilities.delete(nil)
      end
      posibility = @posibilities.pop
      flag = @movements.include?(posibility)
      @posibilities.delete(posibility)
      (@movements << posibility.clone) # unless movements.include?(posibility)
      break if (@posibilities.size < 2) ||  (posibility == @goal) || (@movements.size > 100)
    end
    return @movements
  end

  def check_movement(element, sum, board)
    ren, col = element[:x] + sum[:x] , element[:y] + sum[:y]
    return (board.can_move?(ren, col, 0)) ? { :x => ren, :y => col } : nil
  end
end