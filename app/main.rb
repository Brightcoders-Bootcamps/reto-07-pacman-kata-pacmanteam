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
require_relative "lib/game"

game = Game.new(ENV["PWD"] + "/app/stage1.txt")

ghosts = Thread.new { game.ghost_appear }
capture = Thread.new { game.capture_direction }
board = Thread.new {game.game}

gets.chomp

Thread.kill(ghosts)
Thread.kill(capture)
Thread.kill(board)