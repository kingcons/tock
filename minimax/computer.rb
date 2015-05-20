class Computer
  attr_reader :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
  end

  def get_move(board)
    board.legal_moves.sample
  end
end
