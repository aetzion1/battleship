require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/player'
require './lib/game.rb'

class PlayerTest < Minitest::Test
  def test_it_exists
    player1 = Player.new

    assert_instance_of Player, player1
  end

  def test_player_has_board
    player1 = Player.new

    assert_instance_of Board, player1.board
  end

  def test_player_has_cruiser
    player1 = Player.new

    assert_instance_of Ship, player1.cruiser
  end

  def test_player_has_sub
    player1 = Player.new

    assert_instance_of Ship, player1.submarine
  end

end
