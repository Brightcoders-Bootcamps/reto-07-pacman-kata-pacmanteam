# frozen_string_literal: true
require_relative "../app/lib/board"

describe Board do
	describe "#initialize" do
		it "initialize the board from file" do
			stage = Board.new(ENV["PWD"] + '/app/stage.txt')
		end
	end

  describe "#stage" do
  end

  describe "#print_b" do
    it "print the board" do
      stage = Board.new(ENV["PWD"] + '/app/stage.txt')
      expect(stage.print_b).to eq(nil)
    end
  end
end
