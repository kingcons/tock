class Computer
  attr_reader :name, :character

  def initialize(name="CPU", character)
    @name = name
    @character = character
  end

  def get_move(board)
    board.legal_moves.sample
  end
end
