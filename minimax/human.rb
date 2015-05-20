class Human
  attr_reader :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
  end

  def get_move(board)
    gets.chomp.to_i
  end
end
