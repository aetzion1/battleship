require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/board'
require './lib/cell'
require './lib/ship'
require 'pry'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
  end

  def test_it_exists

    assert_instance_of Board, @board
  end

  def test_it_has_cells
  assert_instance_of Hash, @board.cells
  assert_equal 16, @board.cells.count
  # check taht keys point to obejcts
  end
end
