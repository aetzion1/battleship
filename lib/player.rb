require 'pry'
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

  def status(x)
    if @board.cells[x].render == "H"
      "hit a ship!"
    elsif
      @board.cells[x].render == "M"
      "missed!"
    else @board.cells[x].render == "X"
      "sunk the a ship!"
    end
  end

end
