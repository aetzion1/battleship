require 'pry'
require './lib/cell'
require './lib/ship'
class Board
  attr_reader :cells, :row, :columm, :status

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
     # CHANGE LETTERS TO ASCII
     letters = coordinates.map do |coordinate|
       coordinate.ord
     end
     # CHANGE NUMBERS TO ASCII
     numbers = coordinates.map do |coordinate|
       coordinate.slice(1).to_i
     end
     # CHANGE LETTER+NUMBER TO ASCII
     ascii = coordinates.map do |coordinate|
       coordinate.bytes.inject(:+)
     end
     # CHECK IF HAS SHIP
     return false if coordinates.any? do |coordinate|
       @cells[coordinate].ship
     end
     # CHECK IF RIGHT NUMBER OF SPACES
     return false if ship.length != coordinates.length
     # CHECK EITHER NUMS OR LETTERS ARE SAME
     return false if numbers.uniq.length !=1 && letters.uniq.length !=1
     # CHECK IF LETTERS SAME and NUMS CONS
     return false if (letters.uniq.length == 1) &&
     !(numbers.each_cons(2).all? do |number|
       p number
     end)
     # CHECK IF NUMS SAME AND LETTERS CONS
     return false if (numbers.uniq.length == 1) &&
     !(letters.each_cons(2).all? do |letter|
        p letter
      end)
     # CHECK IF CONSECUTIVE, BUT NOT DIAGONAL
     return false if (ascii.last - ascii.first) != ship.length - 1
    end

   def place(ship,coordinate)

     if coordinate.all? do |coordinate|
       @cells[coordinate].empty?
      end
    end
      if coordinate.each do |coordinate|
        @cells[coordinate].place_ship(ship)
     end
   end


   def render(option = nil)
     #USE CONCAT TO MAKE IT DYNAMIC (BASED ON BOARD SIZE)
     " 1 2 3 4 \n" +
       "A #{@cells["A1"].render(option)} #{@cells["A2"].render(option)} #{@cells["A3"].render(option)} #{@cells["A4"].render(option)}\n" +
       "B #{@cells["B1"].render(option)} #{@cells["B2"].render(option)} #{@cells["B3"].render(option)} #{@cells["B4"].render(option)}\n" +
       "C #{@cells["C1"].render(option)} #{@cells["C2"].render(option)} #{@cells["C3"].render(option)} #{@cells["C4"].render(option)}\n" +
       "D #{@cells["D1"].render(option)} #{@cells["D2"].render(option)} #{@cells["D3"].render(option)} #{@cells["D4"].render(option)}\n"
   end
  end
end
