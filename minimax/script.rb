# I should really add proper tests, huh?

require './tictactoe'

p1 = Human.new "Brit", "X"
p2 = Human.new "Norma", "O"
game = TicTacToe.new(3, p1, p2)

game.play
