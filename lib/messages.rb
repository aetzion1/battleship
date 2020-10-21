module Messages

  def welcome_message
    puts "Welcome to BATTLESHIP\n
    Enter p to play. Enter q to quit."
    print "> "
  end

  def quit_message
    puts "Come back when you're worthy!"
  end

  def setup_message
    puts "I have laid out my ships on the grid.\n
    You now need to lay out your two ships.\n
    The Cruiser is three units long and the Submarine is two units long.\n"
  end

  def player_cruiser_message
    puts "Enter the squares for the Cruiser (3 spaces):"
    print "> "
  end

  def player_sub_message
    puts "Enter the squares for the Submarine (2 spaces):"
    print "> "
  end

  def invalid_message
    puts "Please enter a valid cooridmate \n > "
  end
end
