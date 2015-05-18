require './board'
require './computer'
require './human'
require './super_computer'

class TicTacToe
  def initialize(size, player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new(size)
  end

  def finished?
    @board.draw? || @board.winner?
  end

  def play
    puts "\nWelcome to Tic-Tac-Toe!"
    current_player = @player1
    until self.finished?
      self.turn(current_player)
      current_player = next_player(current_player)
    end
    self.game_over(current_player)
  end

  def next_player(player)
    player == @player1 ? @player2 : @player1
  end

  def turn(player)
    puts @board
    puts
    puts "#{player.name}'s turn! Pick a square ..."
    puts

    move = player.get_move(@board)
    puts "#{player.name} chose #{move} ..."
    puts
    @board.move!(move, player)
  end

  def game_over(player)
    if @board.winner?
      # We're passed the player who would've gone next. Last turn's player won.
      last_player = next_player(player)
      puts "\nPlayer #{last_player.name} wins!\n"
    else
      puts "It's a draw!"
    end
  end
end
