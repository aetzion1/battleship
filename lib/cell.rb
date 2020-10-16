class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize (coordinate, ship = nil, fired_upon = false, status = ".")
    @coordinate = coordinate
    @fired_upon = fired_upon
    # ADDED THIS
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
      #EDIT
      if @ship.health <= 1
      @ship.hit && @status == "X"
    else @status == "H"
    else @status == "M"
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


end
