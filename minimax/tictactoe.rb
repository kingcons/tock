require './board'
require './computer'
require './human'
require './supercomputer'

class TicTacToe
  def initialize(size, player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new(size)
  end

  def play
    puts "\nWelcome to Tic-Tac-Toe!\n\n"
    current_player = @player1
    until @board.game_over?
      self.turn(current_player)
      current_player = next_player(current_player)
    end
    self.game_over(current_player)
  end

  def next_player(player)
    player == @player1 ? @player2 : @player1
  end

  def get_legal_move(player)
    move = player.get_move(@board)
    until @board.legal_move?(move)
      puts "I'm sorry. #{move} is not a valid space. Please choose again.\n"
      move = player.get_move(@board)
    end
    move
  end

  def turn(player)
    puts @board
    puts
    puts "#{player.name}'s turn! Pick a square ..."
    puts

    move = self.get_legal_move(player)
    puts "\n#{player.name} chose #{move} ..."
    puts
    @board.move!(move, player)
  end

  def game_over(player)
    if @board.win?
      # We're passed the player who would've gone next. Last turn's player won.
      last_player = next_player(player)
      puts "\n#{last_player.name} wins!\n"
    else
      puts "It's a draw!"
    end
  end
end
