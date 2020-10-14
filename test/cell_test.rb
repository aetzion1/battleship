require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class Test < Minitest::Test

  def setup
    @cell = Cell.new("B4")
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_it_has_coordinate
    assert_equal "B4", @cell.coordinate
  end

  def test_it_has_a_ship
    assert_equal nil, @cell.ship
  end

  def test_it_is_empty?
    assert @cell.empty?
  end

  def test_ship_placement
    # skip
    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)

    assert_equal cruiser, @cell.ship
  end

  def test_it_is_empty
    # skip
    @cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(@cruiser)
    assert_equal false, @cell.empty?
  end

end
