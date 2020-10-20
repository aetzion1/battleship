require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_it_exists
    player1 = Player.new

    assert_instance_of Player, player1
  end

  def test_player_has_board
    player1 = Player.new

    assert_instance_of Board, player1.board
  end
end
