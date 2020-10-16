require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/board'
require './lib/cell'
require './lib/ship'
require 'pry'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_it_has_cells
  assert_instance_of Hash, @board.cells
  assert_equal 16, @board.cells.count
  end

  def test_coordinates_valid

    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

  def test_ship_array
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_coordinates_consecutive
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"])
  end

  def test_coordinates_diagonal
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.valid_placement?(@submarine, ["C2", "D3"])
  end

  def test_coordinates_valid

    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])

    assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
  end

  def test_edge_case
    skip
        assert_equal false, @board.valid_placement?(@submarine, ["A2", "C1"])
  end

  def test_it_can_place
  @board.place(@cruiser, ["A1", "A2", "A3"])

  assert_equal @board.cells["A1"], @cell_1
  assert_equal @board.cells["A2"], @cell_2
  assert_equal @board.cells["A3"], @cell_3
  end

  def test_it_has_the_same_ship
  @board.place(@cruiser, ["A1", "A2", "A3"])

  assert_equal true, @cell_3.ship == @cell_2.ship
  end

  def test_it_already_has_a_ship
  @board.place(@cruiser, ["A1", "A2", "A3"])

  assert_equal false, @board.valid_placement?(@submarine, ["A1","B1"])
  end

end
