require './lib/cell'
require './lib/ship'
require './lib/board'
require 'pry'

class Game
  attr_reader :player_board,
              :pc_board,
              :cruiser,
              :submarine,
              :pc_cruiser,
              :pc_submarine

  def initialize
    @player_board = Board.new
    @pc_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @pc_cruiser = Ship.new("Cruiser", 3)
    @pc_submarine = Ship.new("Submarine", 2)

    welcome
  end

  def welcome

    puts "Welcome to BATTLESHIP\n
    Enter p to play. Enter q to quit."

    answer = gets.chomp

    if answer == "q" puts "Come back when you're worthy!"

    elsif answer == "p" self.start

    else
    self.welcome
  end

    def start
        puts "I have laid out my ships on the grid.\n
    You now need to lay out your two ships.\n
    The Cruiser is three units long and the Submarine is two units long.\n"

    @player_board.render

    puts "Enter the squares for the Cruiser (3 spaces):\n >"
    crusier_coord = gets.chomp.split(" ")

    end
  end

end



















end
