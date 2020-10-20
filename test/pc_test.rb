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
    pc1 = Player.new

    assert_instance_of Player, pc1
  end

  def test_pc_has_board
    pc1 = Player.new

    assert_instance_of Board, pc1.board
  end

  def test_pc_has_cruiser
    pc1 = Player.new

    assert_instance_of Ship, pc1.cruiser
  end

  def test_pc_has_sub
    pc1 = Player.new

    assert_instance_of Ship, pc1.submarine
  end
end
