require 'minitest/autorun'
require 'pry'

require './tictactoe'

class HumanTest < MiniTest::Test
  def test_humans_have_names
    brit = Human.new "Brit", 'X'
    assert_equal brit.name, "Brit"
  end
end

class ComputerTest < MiniTest::Test
  def test_computers_have_characters
    cpu = Computer.new nil, 'O'
    assert_equal cpu.character, 'O'
  end
end

class SuperComputerTest < MiniTest::Test
  def setup
    @board = Board.new(3)
    @p1 = Human.new 'Brit', 'X'
    @wintermute = SuperComputer.new nil, 'O'
  end

  def moves!(player, *moves)
    moves.each { |x| @board.move!(x, player) }
  end
end

class BoardTest < MiniTest::Test
  def setup
    @board = Board.new(3)
    @p1 = Human.new 'Brit', 'X'
  end

  def place_moves(*moves)
    moves.each { |x| @board.move!(x, @p1) }
  end

  def test_boards_can_be_updated
    assert @board.legal_move?(5)
    place_moves(5)
    refute @board.legal_move?(5)
  end

  def test_boards_recognize_row_wins
    refute @board.winner?
    place_moves(1, 2, 3)
    assert @board.winner?
  end

  def test_boards_recognize_col_wins
    refute @board.winner?
    place_moves(1, 4, 7)
    assert @board.winner?
  end

  def test_boards_recognize_diag_wins
    refute @board.winner?
    place_moves(1, 5, 9)
    assert @board.winner?
  end

  def test_boards_can_determine_illegal_moves
    place_moves(5)
    refute @board.legal_move?(5)
  end

  def test_boards_can_list_available_moves
    place_moves(1, 3, 5, 7, 9)
    assert_equal @board.legal_moves, [2, 4, 6, 8]
  end

  def test_board_knows_when_full
    place_moves(1, 2, 3, 4, 5, 6, 7, 8, 9)
    assert @board.full?
  end
end