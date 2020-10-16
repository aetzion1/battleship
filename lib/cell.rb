class Cell
  attr_reader :coordinate, :ship, :fired_upon, :status

  def initialize (coordinate, ship = nil, fired_upon = false, status = ".")
    @coordinate = coordinate
    @fired_upon = fired_upon
    # ADAM ADDED THIS
    @status = status
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
      #ADAM ADDED THIS
      if @ship.health <= 1
        @ship.hit && @status = "X"
      else @ship.hit && @status = "H"
      end
    else @status = "M"
    end
    #
  end

end

  # def render(option = nil)
  #   # switch or case statement
  #   if option == true && @ship
  #     "S"
  #   elsif @fired_upon == false
  #     "."
  #   elsif @ship == nil
  #     "M"
  #   elsif
  #     @ship && @ship.sunk? == false
  #     "H"
  #   else "X"
  #   end
  # end
