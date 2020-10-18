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

    setup_pc_board
    # puts @pc_board.render(true)
    turn
  end

  def setup_pc_board
    pc_coord = @pc_board.cells.keys.sample(3)
    until @pc_board.valid_placement?(@pc_cruiser, pc_coord)
      pc_coord = @pc_board.cells.keys.sample(3)
    end
    @pc_board.place(@pc_cruiser, pc_coord)

    pc_coord_2 = @pc_board.cells.keys.sample(2)
    until @pc_board.valid_placement?(@pc_submarine, pc_coord_2)
      pc_coord_2 = @pc_board.cells.keys.sample(2)
    end
    @pc_board.place(@pc_submarine, pc_coord_2)
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

  def turn
    puts "=============COMPUTER BOARD=============\n"
    puts @pc_board.render
    puts "==============PLAYER BOARD==============\n"
    puts @player_board.render(true)

    puts "Enter the coordinate for your shot:"
      player_shot = gets.chomp.upcase

      until @pc_board.cells[player_shot].fired_upon == false
        invalid_message
        player_shot = gets.chomp.upcase
      end

      @pc_board.cells[player_shot].fire_upon
    end
  end
      # # hs to be cell on board
      # until @pc_board.cells.keys.include? player_shot

    # computer_shot

# break when either pc_board.ships sunk? or player_board ships usnk
