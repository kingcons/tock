class SuperComputer
  attr_reader :name, :character

  def initialize(name="Wintermute", character)
    @name = name
    @character = character
  end

  def get_move(board)
    # Do the dumb thing for now.
    board.legal_moves.sample
  end
end
