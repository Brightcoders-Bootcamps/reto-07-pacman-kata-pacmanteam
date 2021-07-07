# frozen_string_literal: true

require_relative "../app/lib/pacman"

describe Pacman do
  describe "#calculate_movement" do
    it "calculate the next movement" do
      pacman = Pacman.new.position = [x, y]
      pacman.direction = 3 # [1 => 'izq', 2 => 'der', 3 => 'arr', 4 => 'abj']
      expect(pacman.calculate_movement).to eq([x + 1, y + 1])
    end
  end
end
