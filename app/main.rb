# frozen_string_literal: false

#                          tablero
#                            ||     enviar escenario, imprime el tablero
#                            \/
#                          [game] 
#                           ||  enviar la poscion a los personajes
#                           \/
#                         ghosts, pacman
#                           /\
#                           ||  hereda a
#                         character
require 'timeout'
require "io/console"
require_relative "lib/game"
require_relative "lib/search"
require_relative "lib/character"
require_relative "lib/pacman"
require_relative "lib/ghost"
require_relative "lib/board"
require_relative "lib/helper_game"
require_relative "lib/helper_board"

game = Game.new

ghosts = Thread.new { game.ghost_appear }
capture = Thread.new { game.pacman.capture_direction }
board = Thread.new {
	game.game
	print "game over\n\rpress start to continue.."
}

gets.chomp

Thread.kill(ghosts)
Thread.kill(capture)
Thread.kill(board)


