require 'pry'

class Board
  attr_reader :cells
   def initialize(cells = {})
     @cells = cells
   end
   def cells
     cell_names = ["A1", "A2", " A3", "A4", "B1", "B2","B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
     cell_names.map do |name|
       @cells["#{name}"] = Cell.new(name)
     end
     @cells
   end
end
