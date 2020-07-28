# frozen_string_literal: true

#this function is called in class board
def helper_print_b_character(character, cols, position)
  return ( [character.position[:x], character.position[:y]] == position) ? character.character : cols
end

def helper_find_numeric(element, default)
  if element == "■" 
    0
  elsif element == "░" || element == "w"
    1
  elsif element == " " || element == "s"
    2
  elsif element == "·" || element == "d"
    3
  elsif element == "●" || element == "a"
    4
  else
    default
  end
end
