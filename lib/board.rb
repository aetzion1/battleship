require 'pry'

class Board
  attr_reader :cells, :row, :columm

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
     cells_ord = coordinates.map do |cell|
       cell.split("")
     end
     cells_ord = cells_ord.map do |cell|
       cell.ord
     end
   end
end
