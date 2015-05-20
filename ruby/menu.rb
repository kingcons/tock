class Menu
  def initialize
    @player1 = nil
    @player2 = nil
  end

  def welcome
    puts "\n\nWelcome to Tic-Tac-Toe!\n\n"
    puts "I hope you've played before because I don't intend to explain it."
  end

  def prompt(message, validator)
    puts message
    choice = gets.chomp
    until choice =~ validator
      puts "Sorry, that's not a a valid response."
      puts message
      choice = gets.chomp
    end
    choice
  end

  def choose_piece(other_player)
    if other_player
      letter = other_player == 'X' ? 'O' : 'X'
    else
      letter = self.prompt("Would you like to play 'X' or 'O'?", /^[xo]$/)
    end
    letter.upcase
  end

  def choose_player_type(n, other=nil)
    puts "\nHey there, Player #{n}!\n"
    message =  "Please choose one of the following options:
            '1' for a Human player,
            '2' for an easy computer,
            '3' for a smart computer."

    choice = self.prompt(message, /^[123]$/).to_i
    name = self.prompt("What's your name?", /^\w+$/) if choice == 1
    letter = self.choose_piece(other)

    case choice
    when 1 then Human.new(name, letter)
    when 2 then Computer.new('CPU', letter)
    when 3 then SuperComputer.new('Wintermute', letter)
    end
  end

  def play_again?
    'y' == self.prompt("\nWould you like to play a(nother) game? (y/n)", /^[yn]$/)
  end

  def switch_players?
    'y' == self.prompt("\nWould you like to switch players? (y/n)", /^[yn]$/)
  end

  def choose_players
    @player1 = self.choose_player_type(1, nil)
    @player2 = self.choose_player_type(2, @player1.piece)
  end

  def run
    welcome
    self.choose_players

    while self.play_again?
      game = TicTacToe.new(3, @player1, @player2)
      game.play
      self.choose_players if self.switch_players?
    end
  end
end
