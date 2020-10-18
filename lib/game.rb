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
      quit_message
    elsif answer == 'p'
      setup
    else start
    end
  end

  def setup
    setup_message
    puts @player_board.render()

    setup_cruiser
    puts @player_board.render(true)

    setup_sub
    puts @player_board.render(true)
  end

  def setup_cruiser
    player_cruiser_message
    input = gets.chomp.upcase.split(" ")
    if input.length != 3
      try_again_message
      setup_cruiser
    end
    if @player_board.valid_placement?(@cruiser,input)
      @player_board.place(@cruiser,input)
    else setup_cruiser
    end
  end

  def setup_sub
    player_sub_message
    input = gets.chomp.upcase.split(" ")
    if input.length != 2
      try_again_message
      setup_sub
    end
    if @player_board.valid_placement?(@submarine,input)
      @player_board.place(@submarine,input)
    else setup_sub
    end
  end
end
