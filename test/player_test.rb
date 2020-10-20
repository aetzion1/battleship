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

  def test_player_board_status_hit
    player1 = Player.new
    player1.board.place(player1.submarine, ["A1", "A2"])
    player1.board.cells["A1"].fire_upon

    assert_equal "hit a ship!", player1.status("A1")
  end

  def test_player_board_status_miss
    player1 = Player.new
    player1.board.place(player1.submarine, ["A1", "A2"])
    player1.board.cells["A3"].fire_upon

    assert_equal "missed!", player1.status("A3")
  end

  def test_pc_board_status_sunk
    player1 = Player.new
    player1.board.place(player1.submarine, ["A1", "A2"])
    player1.board.cells["A1"].fire_upon
    player1.board.cells["A2"].fire_upon

    assert_equal "sunk a ship!", player1.status("A1")
  end
end
