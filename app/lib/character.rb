# frozen_string_literal: true

class Character
	attr_reader :board, :character, :position, :direction

	def initialize(args, posibilities)
		@board = args.clone
		@posibilities = posibilities
	end
	
	 def helper_print_b_character(cols, position)
    return ( [@position[:x], @position[:y]] == position) ? @character : cols
  end
	
end