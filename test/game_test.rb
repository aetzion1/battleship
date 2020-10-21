require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/pc'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'



class GameTest < Minitest::Test

  def setup
    @game = Game.new
  end

  def test_it_exists_and_has_attributes

    assert_instance_of Game, @game
  end

  def test_victory
    @game.victory
    expected = "You weren't worthy... Come back if you dare!"

    assert_equal expected, @game.victory
  end

end
