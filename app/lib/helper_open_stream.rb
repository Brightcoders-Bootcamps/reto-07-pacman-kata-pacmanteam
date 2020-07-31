# frozen_string_literals: true


def open_file(stream, board, board_numeric)
  stream.each_with_index do |element, pointer|
    board << Array.new()
    board_numeric << Array.new()
    check_element(element, pointer, board, board_numeric)
  end
end

def check_element(element, pointer, board, board_numeric)
  (0..element.size - 2).each do |elem|
    board[pointer] << element[elem]
    board_numeric[pointer] << helper_find_numeric(element[elem], 0)
  end
end