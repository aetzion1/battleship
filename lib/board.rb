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
     y = coordinates.map do |coordinate|
       coordinate.bytes
     end
     z = y.map do |coordinate|
       coordinate.sum
     end
      (z.last - z.first == ship.length - 1) #&&
      # coordinates.to_s.delete('^A-Z').chars.each_cons(2).any? {|a,b| a == b }
       # end) or x = coordinates.map do |cell|
       #   cell.ord
       # end.uniq.count <= 1)
   end

   def place(ship,coordinate)
       @cells[coordinate].place_ship
   end

end
