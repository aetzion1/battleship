class Cell
  attr_reader :coordinate, :ship

  def initialize (coordinate, ship = nil)
    @coordinate = coordinate
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

  def fired_upon?
  end

  def fire_upon
  end

end
