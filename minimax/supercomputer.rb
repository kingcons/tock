class SuperComputer
  attr_reader :name, :piece

  def initialize(name="Wintermute", piece)
    @name = name
    @piece = piece
    @next_move = nil
  end

  def get_move(board)
    self.negamax(board, self)
    @next_move
  end

  def negamax(board, player)
    if board.game_over?
      board.score(self)
    else
      max_score = -100
      board.legal_moves.each do |move|
        new_board = board.successor(move, self)
        score = -negamax(new_board, self.opponent)
        if score > max_score
          max_score = score
          # The next line breaks lookahead in the recursion. Need depth!
          @next_move = move
        end
      end
      max_score
    end
  end

  def opponent
    next_player = self.clone
    piece = @piece == 'X' ? 'O' : 'X'
    next_player.instance_variable_set(:@piece, piece)
    next_player
  end
end
