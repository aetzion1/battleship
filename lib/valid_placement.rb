module ValidPlacement

  def lengths_different(ship, coordinates)
    return ship.length != coordinates.length
  end

  def coordinates_have_ship(coordinates)
    coordinates.any? do |coordinate|
      @cells[coordinate].ship
    end
  end

  def no_common_row_or_column(coordinates)
    letters = coordinates.map do |coordinate|
      coordinate.ord
    end
    numbers = coordinates.map do |coordinate|
      coordinate.slice(1).to_i
    end
    letters.uniq.length != 1 && numbers.uniq.length != 1
  end

  def coordinates_not_consecutive(ship, coordinates)
    #separate letters
    letters = coordinates.map do |coordinate|
      coordinate.ord
    end
    #separate numbers
    numbers = coordinates.map do |coordinate|
      coordinate.slice(1).to_i
    end
    # get ascii
    ascii = coordinates.map do |coordinate|
      coordinate.bytes.inject(:+)
    end
    # return false if numbers same and letters cons
    return false if (letters.uniq.length == 1) &&
      numbers.each_cons(2).all? do |num1, num2|
        num1 == num2 - 1
      end
      # return false if letters same and nums cons
    return false if (numbers.uniq.length == 1) &&
      letters.each_cons(2).all? do |let1, let2|
        let1 == let2-1
      end
    return false if (ascii.last - ascii.first) == ship.length - 1 && (ascii.max - ascii.min) == ship.length - 1
    return true
  end
end
