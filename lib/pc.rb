require './lib/cell'
require './lib/ship'
require './lib/board'

class Pc
  attr_reader :board, :cruiser, :submarine, :status

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def status(coordinate)
    if @board.cells[coordinate].render == "H"
      "hit a ship!"
    elsif
      @board.cells[coordinate].render == "M"
      "missed!"
    else @board.cells[coordinate].render == "X"
      "sunk a ship!"
    end
  end

  def setup_pc_board
    pc_coord = @board.cells.keys.sample(3)

    until @board.valid_placement?(@cruiser, pc_coord)
      pc_coord = @board.cells.keys.sample(3)
    end
    @board.place(@cruiser, pc_coord)

    pc_coord_2 = @board.cells.keys.sample(2)

    until @board.valid_placement?(@submarine, pc_coord_2)
      pc_coord_2 = @board.cells.keys.sample(2)
    end
    @board.place(@submarine, pc_coord_2)
  end
end
