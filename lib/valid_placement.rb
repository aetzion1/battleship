# class Valid_placement
#
#
# def initialize(ship, coordinates)
#   @ship = ship
#   @coordinates = []
# end
#
# def same_length_as_ship(ship, coordinates)
#   ship.count == coordinates.count
# end
#
# def coordinates_consecutive(coordinates)
#   #either numbers or letters are the same then check the other
#   letters = coordinates.map do |coordinate|
#     coordinate.ord
#   end
#
#   numbers = coordinates.map do |coordinate|
#     coordinate.slice(1).to_i
#   end
#
#   if numbers.uniq.length == 1
#     letters.each_cons(2).all? do |letter|
#       p letter
#     end
#   elsif letters.uniq.length == 1
#     numbers.each_cons(2).all? do |number|
#       p number
#     end
#   else return false
#   end
# end
#
#
# # CHANGE LETTERS TO ASCII
# letters = coordinates.map do |coordinate|
#   coordinate.ord
# end
# # CHANGE NUMBERS TO ascii
# numbers = coordinates.map do |coordinate|
#   coordinate.slice(1).to_i
# end
# # CHANGE LETTER+NUMBER TO ASCII
# ascii = coordinates.map do |coordinate|
#   coordinate.bytes.inject(:+)
# end
# # CHECK IF HAS SHIP
# return false if coordinates.any? do |coordinate|
#   @cells[coordinate].ship
# end
#
# # CHECK IF RIGHT NUMBER OF SPACES
# return false if ship.length != coordinates.length
# # CHECK EITHER NUMS OR LETTERS ARE SAME
# return false if numbers.uniq.length !=1 && letters.uniq.length !=1
# # CHECK IF LETTERS SAME and NUMS CONS
# return false if (letters.uniq.length == 1) &&
# !(numbers.each_cons(2).all? do |number|
#   p number
# end)
# # CHECK IF NUMS SAME AND LETTERS CONS
# return false if (numbers.uniq.length == 1) &&
# !(letters.each_cons(2).all? do |letter|
#   p letter
# end)
# # CHECK IF CONSECUTIVE, BUT NOT DIAGONAL
# return false if (ascii.last - ascii.first) != ship.length - 1 && (ascii.max - ascii.min) != ship.length - 1
# return true
#
# end
