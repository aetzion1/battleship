require './lib/cell'
require './lib/ship'
require './lib/valid_placement'

class Board
  attr_reader :cells, :row, :columm, :status
  include ValidPlacement

  def initialize(board_size = 4)
    @board_size = board_size
    @row = []
    @column = []
    @cells = {}
    populate_board
  end

  def populate_board
    ('A'..'Z').each do |letter|
      break if letter.ord > (@board_size + 64)
      @row << letter
    end
    (1..(@board_size)).each do |number|
      @column << number
    end
    @column.each do |number|
      @row.each do |letter|
        @cells["#{letter}#{number}"] = Cell.new("#{letter}#{number}")
      end
    end
  end

  def valid_coordinate?(cell)
    self.cells.key?(cell)
  end

  def valid_placement?(ship, coordinates = [])
    return false if lengths_different(ship, coordinates)
    return false if coordinates_have_ship(coordinates)
    return false if coordinates_not_consecutive(ship, coordinates)
    return false if no_common_row_or_column(coordinates)
    return true
  end

  def place(ship,coordinate)
    if coordinate.all? do |coordinate|
      @cells[coordinate].empty?
      end
    end
   coordinate.each do |coordinate|
     @cells[coordinate].place_ship(ship)
   end
 end

 def render(option = nil)
  " 1 2 3 4 \n" +
    "A #{@cells["A1"].render(option)} #{@cells["A2"].render(option)} #{@cells["A3"].render(option)} #{@cells["A4"].render(option)}\n" +
    "B #{@cells["B1"].render(option)} #{@cells["B2"].render(option)} #{@cells["B3"].render(option)} #{@cells["B4"].render(option)}\n" +
    "C #{@cells["C1"].render(option)} #{@cells["C2"].render(option)} #{@cells["C3"].render(option)} #{@cells["C4"].render(option)}\n" +
    "D #{@cells["D1"].render(option)} #{@cells["D2"].render(option)} #{@cells["D3"].render(option)} #{@cells["D4"].render(option)}\n"
  end
end
