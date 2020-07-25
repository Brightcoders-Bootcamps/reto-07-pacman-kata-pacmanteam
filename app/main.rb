# frozen_string_literal: true

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
require_relative "lib/game"

game = Game.new(ENV["PWD"] + "/app/stage.txt")

controls = Thread.new{ game.capture_direction }
ghosts = Thread.new{ game.ghost_appear }
gexe = Thread.new{ game.game }
gets.chomp
Thread.kill(controls)
Thread.kill(ghosts)
Thread.kill(gexe)
