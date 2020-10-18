require './lib/player'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/messages'
require 'pry'

class Game
  attr_reader :player_board, :pc_board, :cruiser, :submarine, :pc_cruiser, :pc_submarine
  include Messages

  def initialize
    @player_board = Board.new
    @pc_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @pc_cruiser = Ship.new("Cruiser", 3)
    @pc_submarine = Ship.new("Submarine", 2)
  end

  def start
    welcome_message
    answer = gets.chomp.downcase
    if answer == 'q'
      try_again
    elsif answer == 'p'
      setup
    else start
    end
  end

  def setup
    setup_message

    puts @player_board.render()

    # puts "Enter the squares for the Cruiser (3 spaces):"
    # print "> "
    # input = gets.chomp
    # # convert to split.. etc.
    # if @player_board.valid_placement?(input)
    #
  end
end
