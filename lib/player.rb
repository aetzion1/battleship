require './lib/cell'
require './lib/ship'
require './lib/board'

class Player
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
end
