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

  def test_pc_board_status_hit
    pc1 = Player.new
    pc1.board.place(pc1.submarine, ["A1", "A2"])
    pc1.board.cells["A1"].fire_upon

    assert_equal "hit a ship!", pc1.status("A1")
  end

  def test_pc_board_status_miss
    pc1 = Player.new
    pc1.board.place(pc1.submarine, ["A1", "A2"])
    pc1.board.cells["A3"].fire_upon

    assert_equal "missed!", pc1.status("A3")
  end



end
