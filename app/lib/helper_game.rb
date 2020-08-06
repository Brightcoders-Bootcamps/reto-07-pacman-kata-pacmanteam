# frozen_string_literal: true

def helper_find_numeric(element, default)
  options, ret_num = [["■"], ["░", "w"], [" ", "s"], ["·", "d"], ["●", "a"], [default]], 0
  options.each_with_index {|elem, index| ret_num = index if elem.include?(element) }
  ret_num
end