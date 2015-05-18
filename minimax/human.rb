class Human
  attr_reader :name, :character

  def initialize(name, character)
    @name = name
    @character = character
  end

  def get_move(board)
    gets.chomp.to_i
  end
end
