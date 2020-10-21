require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/pc'
require './lib/game'

class PCTest < Minitest::Test
  def test_it_exists
    pc1 = Pc.new

    assert_instance_of Pc, pc1
  end

  def test_pc_has_board
    pc1 = Pc.new

    assert_instance_of Board, pc1.board
  end

  def test_pc_has_cruiser
    pc1 = Pc.new

    assert_instance_of Ship, pc1.cruiser
  end

  def test_pc_has_sub
    pc1 = Pc.new

    assert_instance_of Ship, pc1.submarine
  end

  def test_pc_board_status_hit
    pc1 = Pc.new
    pc1.board.place(pc1.submarine, ["A1", "A2"])
    pc1.board.cells["A1"].fire_upon

    assert_equal "hit a ship!", pc1.status("A1")
  end

  def test_pc_board_status_miss
    pc1 = Pc.new
    pc1.board.place(pc1.submarine, ["A1", "A2"])
    pc1.board.cells["A3"].fire_upon

    assert_equal "missed!", pc1.status("A3")
  end

  def test_pc_board_status_sunk
    pc1 = Pc.new
    pc1.board.place(pc1.submarine, ["A1", "A2"])
    pc1.board.cells["A1"].fire_upon
    pc1.board.cells["A2"].fire_upon

    assert_equal "sunk a ship!", pc1.status("A1")
  end
end
