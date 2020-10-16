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
     letters = coordinates.map do |coordinate|
       coordinate.ord
     end
     numbers = coordinates.map do |coordinate|
       coordinate.slice(1).to_i
     end
     ascii = coordinates.map do |coordinate|
       coordinate.bytes.inject(:+)
     end
     # CHECK IF HAS SHIP
     return false if coordinates.any? do |coordinate|
       @cells[coordinate].ship
     end
     # CHECK IF RIGHT NUMBER OF SPACES
     return false if coordinates.any? do |coordinate|
       ship.length != coordinates.length
     end
     # CHECK EITHER NUMS OR LETTERS ARE SAME
     return false if numbers.uniq.length !=1 && letters.uniq.length !=1
     # CHECK IF LETTERS SAME and NUMS CONS
     return false if (letters.uniq.length == 1) &&
     !(numbers.each_cons(2).all? do |number|
       p number
     end)
     # CHECK IF NUMS SAME AND LETTERS CONS
     return false if (numbers.uniq.length == 1) &&
     !(letters.each_cons(2).all? { |letter| p letter})
     # CHECK IF CONSECUTIVE, BUT NOT DIAGONAL
     return false if (ascii.last - ascii.first) != ship.length - 1
   else true
   end

   def place(ship,coordinate)
     # binding.pry
     if coordinate.all? do |coordinate|
       @cells[coordinate].empty?
      end
    end
      if coordinate.each do |coordinate|
        @cells[coordinate].place_ship(ship)
     end
   end


   def render(show = nil)
     binding.pry
     " 1 2 3 4 \n".concat(
       "A ", "#{@cells["A1"].status} #{@cells["A2"].status} #{@cells["A3"].status} #{@cells["A4"].status}\n",
       "B ", "#{@cells["B1"].status} #{@cells["B2"].status} #{@cells["B3"].status} #{@cells["B4"].status}\n",
       "C ", "#{@cells["C1"].status} #{@cells["C2"].status} #{@cells["C3"].status} #{@cells["C4"].status}\n",
       "D ", "#{@cells["D1"].status} #{@cells["D2"].status} #{@cells["D3"].status} #{@cells["D4"].status}")

       # if @cells["A1"].status.health == 0
       #   p "X"
       #
       # #{@cells.} \n"

       # @cells.sort.each do |cell|
         # binding.pry
   end
  end
end
