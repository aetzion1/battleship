require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/valid_placement'
require 'pry'


class ValidplacementTest < require 'minitest/autorun'

  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end


  def test_ship_array
      assert_equal false, @board.valid_placement.same_length_as_ship(@cruiser, ["A1", "A2"])
      assert_equal false, @board.valid_placement.same_length_as_ship(@submarine, ["A2", "A3", "A4"])
  end

  # def test_coordinates_consecutive
  #     assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
  #     assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
  #     assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
  #     assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"])
  # end
  #
  # def test_coordinates_diagonal
  #     assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
  #     assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
  #     assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "C2"])
  #     assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A4", "C2"])
  #     assert_equal false, @board.valid_placement?(@submarine, ["C2", "D3"])
  # end
  #
  # def test_coordinates_valid
  #
  #     assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
  #
  #     assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
  # end
  #
  # def test_edge_case
  #
  #     assert_equal false, @board.valid_placement?(@submarine, ["A2", "C1"])
  # end
  #
  # def test_it_already_has_a_ship
  #   @board.place(@cruiser, ["A1", "A2", "A3"])
  #
  #   assert_equal false, @board.valid_placement?(@submarine, ["A1","B1"])
  # end

  end
