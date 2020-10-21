require './lib/player'
require './lib/pc'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/messages'
require './lib/valid_placement'

class Game
  attr_reader :cruiser, :submarine
  include Messages

  def initialize
    @player = Player.new
    @pc = Pc.new
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
    @pc.setup_pc_board
    until @pc.cruiser.sunk? && @pc.submarine.sunk? || @player.cruiser.sunk? && @player.submarine.sunk?
      sleep(2)
      turn
    end
     p victory
  end

  def setup_cruiser
    player_cruiser_message
    input = gets.chomp.upcase.split(" ")
    if input.length != 3
      invalid_message
      setup_cruiser
    end

    if @player.board.valid_placement?(@player.cruiser,input)
      @player.board.place(@player.cruiser,input)
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
    if @player.board.valid_placement?(@player.submarine,input_2)
      @player.board.place(@player.submarine,input_2)
    else setup_sub
    end
  end

    def victory
      if @pc.cruiser.sunk? && @pc.submarine.sunk?
          "I underestimated you! Victory is yours!"
      else @player.cruiser.sunk? && @player.submarine.sunk?
          "You weren't worthy... Come back if you dare!"
      end
    end

  def turn
    puts "=============COMPUTER BOARD=============\n"
    puts @pc.board.render
    puts "==============PLAYER BOARD==============\n"
    puts @player.board.render(true)

    puts "Enter the coordinate for your shot:"
      player_shot = gets.chomp.upcase

      until @pc.board.valid_coordinate?(player_shot) && @pc.board.cells[player_shot].fired_upon == false
          invalid_message
        player_shot = gets.chomp.upcase
      end

      @pc.board.cells[player_shot].fire_upon
      puts "Your shot on #{player_shot} #{@pc.status(player_shot)}"

      pc_shot= @player.board.cells.keys.sample(1).join

      until @player.board.cells[pc_shot].fired_upon == false
        pc_shot = @player.board.cells.keys.sample(1).join
      end
      @player.board.cells[pc_shot].fire_upon
      puts "Their shot on #{pc_shot} #{@player.status(pc_shot)}"
      end
  end
