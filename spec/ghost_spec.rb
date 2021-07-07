# frozen_string_literal: true

require_relative "../app/lib/ghost"

describe Ghost do
  describe "#calculate_movement" do
    it "calculate the next movement" do
      ghost = Ghost.new.position = [x, y]
      # direction of ghost are defined by pacman position
      expect(ghost.calculate_movement([x, y])).to eq([x + 1, y + 1])
    end
  end
end
