# frozen_string_literal: true
require "io/console"
require_relative "pacman"
require_relative "ghost"
require_relative "board"
require_relative "helper_functions"
# This class is a core
# - Contains pacman, ghost and board
# - Send the data from board to ghost and pacman
# - Send the pacman and ghost position to board for print it
# - Create a new ghosts
# - if pacman colision with a ghost, is the game over

class Game < Board
  attr :points, :level, :velocity, :stage

  def initialize(arguments)
    @stage = arguments
    super(arguments)
    @points = 0
    @level = 0
    @velocity = 0.5
    @pacman = Pacman.new(@board_numeric)
    @ghosts = Array.new()
  end

  def ghost_appear
    while true do
      if @ghosts.size < 6
        @ghosts << Ghost.new(@board_numeric)
      end
      sleep(5)
    end
  end

  def capture_direction
    # this method must be executed in a thread for capture
    # the direction for pacman
    capture_value = STDIN.getch
    
    @pacman.direction = helper_find_numeric(capture_value, @pacman.direction)
    
    return nil if (capture_value == "\r") || (capture_value == "\n")
    return capture_direction
  end

  def game
    # execute a infinite loop for call the printboard
    while true do
      system("clear")
      calculate_points
      level_up
      characters_behavior
      print_b
      print "Points: #{@points}, level: #{@level}\n\r"
      puts "press enter to exit..."
      sleep(@velocity)
    end
  end

  private

  def calculate_points
    pac_x, pac_y, condition = @pacman.position[:x], @pacman.position[:y], @board_numeric[@pacman.position[:x]][@pacman.position[:y]]
    if condition > 2
      @points += 1
      @board[pac_x][pac_y] = " "
      @board_numeric[pac_x][pac_y] = 2
    end
  end

  def characters_behavior
    @pacman.calculate_movement # this method will wait to command input for the user
    @ghosts.each do |ghost|
      ghost.calculate_movement(@pacman.position)
    end
  end

  def level_up
    if (@board.include?("·") && @board.include?("●"))
      last_level = @level
      last_velocity = @velocity
      initialize(@stage)
      @level = last_level + 1
      @velocity = last_velocity - 0.02
    end
  end

end
