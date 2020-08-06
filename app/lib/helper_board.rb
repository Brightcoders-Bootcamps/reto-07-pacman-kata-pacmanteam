# frozen_string_literal: true 
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