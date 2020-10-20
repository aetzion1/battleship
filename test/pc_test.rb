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
end
