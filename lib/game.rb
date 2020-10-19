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
    @player = Player.new
    @pc = Player.new

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
    puts @player.board.render()

    setup_cruiser
    puts @player.board.render(true)

    setup_sub
    puts @player.board.render(true)

    setup_pc_board
    # puts @pc_board.render(true)
    turn
  end

  def setup_pc_board
    pc_coord = @pc.board.cells.keys.sample(3)
    until @pc.board.valid_placement?(@pc.cruiser, pc_coord)
      pc.coord = @pc.board.cells.keys.sample(3)
    end
    @pc.board.place(@pc.cruiser, pc_coord)

    pc_coord_2 = @pc.board.cells.keys.sample(2)
    until @pc.board.valid_placement?(@pc.submarine, pc_coord_2)
      pc_coord_2 = @pc.board.cells.keys.sample(2)
    end
    @pc_board.place(@pc.submarine, pc_coord_2)
  end

  def setup_cruiser
    player_cruiser_message
    input = gets.chomp.upcase.split(" ")
    if input.length != 3
      invalid_message
      setup_cruiser
    end
    if @player.board.valid_placement?(@cruiser,input)
      @player.board.place(@cruiser,input)
    else setup_cruiser
    end
  end

  def setup_sub
    player_sub_message
    input_2 = gets.chomp.upcase.split(" ")
    if input_2.length != 2
      invalid_message
      setup_sub
    end
    if @player.board.valid_placement?(@submarine,input_2)
      @player.board.place(@submarine,input_2)
    else setup_sub
    end
  end

  def turn
    puts "=============COMPUTER BOARD=============\n"
     @pc.board.render(true)#Remember to remove true
    puts "==============PLAYER BOARD==============\n"
     @player.board.render(true)

    puts "Enter the coordinate for your shot:"
      player_shot = gets.chomp.upcase

      until @pc.board.valid_coordinate?(player_shot) && @pc.board.cells[player_shot].fired_upon == false
          invalid_message
        player_shot = gets.chomp.upcase
      end

      @pc.board.cells[player_shot].fire_upon
      puts "Your shot on #{player_shot} #{pc_status(player_shot)}"

      #PC Shoots
      pc_shot= @player.board.cells.keys.sample(1).join
      binding.pry

      until @player.board.cells[pc_shot].fired_upon == false
        pc_shot = @player.board.cells.keys.sample(1).join
      end
      @player.board.cells[pc_shot].fire_upon
      puts "Thier shot on #{pc_shot} #{player_status(pc_shot)}"
    end

    def pc_status(x)
      if @pc.board.cells[x].render == "H"
        "hit a ship!"
      elsif
        @pc.board.cells[x].render == "M"
        "missed!"
      else @pc.board.cells[x].render == "X"
        "sunk the a ship!"
      end
    end

    def player_status(x)
      if @player.board.cells[x].render == "H"
        "hit a ship!"
      elsif
        @player.board.cells[x].render == "M"
        "missed!"
      else @player.board.cells[x].render == "X"
        "sunk the a ship!"
      end
    end

  end

#Turns until no ship on one side
#Declare winner
# break when either pc_board.ships sunk? or player_board ships usnk
