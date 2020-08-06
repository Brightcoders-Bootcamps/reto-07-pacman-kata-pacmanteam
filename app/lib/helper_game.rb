# frozen_string_literal: true

def character_behavior(pacman, ghosts)
  gameover = nil
  pacman.calculate_movement # this method will wait to command input for the user
  ghosts.map do |ghost|
    ghost.calculate_movement(pacman.position)
    (gameover = true) if pacman.position == ghost.position
  end
  gameover
end

def level_up(level, velocity, board)
  flag = false
  board.board_numeric.map { |element| (flag = true) if (element.include?(3) || element.include?(4)) }
  unless flag
    board = Board.new
    return level + 1, velocity - 0.02, board
  end
  return level, velocity, board
end

def helper_find_numeric(element, default)
  options, ret_num = [["■"], ["░", "w"], [" ", "s"], ["·", "d"], ["●", "a"], [default]], 0
  options.each_with_index {|elem, index| ret_num = index if elem.include?(element) }
  ret_num
end

def print_b(ghosts, pacman, board)
  system("clear")
  board.each_with_index do |ren, index_i|
    ren.each_with_index do |cols, index_j|
      ghosts.map{ |ghost| cols = ghost.helper_print_b_character(cols, [index_i, index_j]) }
      cols = pacman.helper_print_b_character(cols, [index_i, index_j])
      print cols
    end
    print "\r"
  end
end