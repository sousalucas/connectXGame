class Game

  GAME_TYPE_CONST = [1,2,3]

  def initialize
  end

  def start
    puts
    puts " *** Welcome to Connect X Game ***"
    puts
    puts "Choose game type:"
    puts "1 - Human vs Computer"
    puts "2 - Human vs Human"
    puts "3 - Computer vs Computer"
    puts "0 - Exit"

    gameType = gets.to_i

    if(GAME_TYPE_CONST.include? gameType)
      return gameType
    elsif gameType == 0
      exit!
    else
      system 'clear'
      puts "Invalid Option (press any button)"
      gets
      system 'clear'
      self.start
    end
  end

  def totalPositions
    puts "invalido"
  end

end
