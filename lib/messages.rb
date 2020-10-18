module Messages

  def welcome_message
    puts "Welcome to BATTLESHIP\n
    Enter p to play. Enter q to quit."

    print "> "
  end

  def try_again
    puts "Come back when you're worthy!"
  end

  def setup_message
    puts "I have laid out my ships on the grid.\n
    You now need to lay out your two ships.\n
    The Cruiser is three units long and the Submarine is two units long.\n"
  end

end
