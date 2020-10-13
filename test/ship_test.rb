require 'minitest/autorun'
require 'minitest/pride'
require './lib/'

class Test < Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end


  def test_it_exists
    assert_instance_of Ship, @cruiser
  end

  def test_it_has_a_name
    assert_equal "Cruiser", cruiser.name
  end

  def test_its_length
    assert_equal 3, cruiser.length
  end

  def test_its_health
    assert_equal 3, cruiser.health
  end

  def test_its_sunk?
    assert_equal false, cruiser.sunk?
  end

  def test_its_been_hit
    @cruiser.hit
    assert_equal 2, cruiser.health
  end

end
