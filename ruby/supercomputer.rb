class SuperComputer
  attr_reader :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
    @next_move = nil
  end

  def get_move(board)
    self.negamax(board)
    @next_move
  end

  def negamax(board)
    if board.game_over?
      board.score(self)
    else
      max_score = -100
      board.legal_moves.each do |move|
        next_board = board.successor(move, self)
        next_player = self.opponent
        score = -next_player.negamax(next_board)
        if score > max_score
          max_score = score
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
