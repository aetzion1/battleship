require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'

class Player
  attr_reader :player_board, :cruiser, :submarine

  def initialize
    @player_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end
end
