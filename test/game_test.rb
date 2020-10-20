require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/pc'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'
require './lib/valid_placement'
require './lib/messages'
require 'pry'

class GameTest < Minitest::Test
  # include ValidPlacement
  # include Messages
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

  def test_it_can_setup_pc_board
      @game.setup_pc_board

      assert_equal true, @pc.board.valid_placement?(@pc.submarine, pc_coord_2)
  end

end
