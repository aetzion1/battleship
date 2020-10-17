require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'

class Game


  def startup

    puts "Welcome to BATTLESHIP\n
    Enter p to play. Enter q to quit."

    gets.chomp

    if  p then @game.setup game

    if  q then quit game

    else puts "Welcome to BATTLESHIP\n
    Enter p to play. Enter q to quit."

  end

  def setup
    player_board = Board.new
    computer_board = Board.new

    puts "I have laid out my ships on the grid.\n
    You now need to lay out your two ships.\n
    The Cruiser is three units long and the Submarine is two units long.\n"

    player_board.render

    puts "Enter the squares for the Cruiser (3 spaces):"

  end























end
