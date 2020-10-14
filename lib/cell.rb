class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize (coordinate, ship = nil, fired_upon = false)
    @coordinate = coordinate
    @fired_upon = fired_upon
  end

  def empty?
    if @ship == nil
      true
    else false
    end
  end

  def place_ship(ship_name)
    @ship = ship_name
  end

  def fire_upon
    @fired_upon = true
    if @ship
      @ship.hit
    end
  end

  def render # add option???
    # switch or case statement
    # if option = true && @ship
    #   "S"
    if @fired_upon == false
      "."
    elsif @ship == nil
      "M"
    elsif
      @ship && @ship.sunk? == false
      "H"
    else "X"
    end
  end

end
