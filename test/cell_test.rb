require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class Test < Minitest::Test

  def setup
    @cell = Cell.new("B4")
    @cell_1 = @cell
    @cell_2 = Cell.new("C3")
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

  def test_it_can_render
    assert_equal ".", @cell_1.render
  end

  def test_it_can_be_fired_upon
    @cell_1.fire_upon
    assert_equal "M", cell_1.render
  end

  def test_another_can_be_rendered
    @cell_1.fire_upon
    @cruiser = Ship.new("Cruiser", 3)
    @cell_2.place_ship(cruiser)
    assert_equal ".", @cell_2.render
  end

  def test_it_can_show_ship
    @cell_1.fire_upon
    @cruiser = Ship.new("Cruiser", 3)
    @cell_2.place_ship(cruiser)
    assert_equal "S", cell_2.render(true)
  end

  def test_it_can_render_after_fired_upon
    @cell_1.fire_upon
    @cruiser = Ship.new("Cruiser", 3)
    @cell_2.place_ship(cruiser)
    @cell_2.fire_upon
    assert_equal "H", @cell_2.render
    assert_equal 2, @cell_2.health
    refute @cell_2.sunk?
  end

  def test_ship_can_be_sunk
    @cell_1.fire_upon
    cruiser = Ship.new("Cruiser", 3)
    @cell_2.place_ship(cruiser)
    @cell_2.fire_upon
    cruiser.hit
    cruiser.hit
    assert_equal "X", @cell_2.render
    assert_equal 0, @cell_2.health
    assert @cell_2.sunk?
  end
end
