require './human'
require './computer'
require './board'

class Game

  GAME_TYPE_CONST = [1,2,3]

  @@plays = Hash.new
  @@players = Array.new
  @@board = Board.new(4,4)

  def initialize
  end

  def prepareGame
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
      case gameType
      when 1
        self.addPlayer(Human.new('H1', 'o'))
        self.addPlayer(Computer.new('C1', 'x'))
      when 2
        self.addPlayer(Human.new)
        self.addPlayer(Human.new)
      when 3
        self.addPlayer(Computer.new)
        self.addPlayer(Computer.new)
      end
    elsif gameType == 0
      exit!
    else
      system 'clear'
      puts "Invalid Option (press any button)"
      gets
      system 'clear'
      self.prepareGame
    end
  end

  def addPlayer(player)
    @@players << player
  end

  def play
    @@players.each do |p|
      pp = p.play
      while checkPlayExists(pp)
        puts "Invalid Play, try again..."
        pp = p.play
      end
      self.addPlay(pp, p.getSymbol)
    end
  end

  def drawBoard
    @@board.draw(@@plays)
  end

  def checkEndGame()
    return false
  end

  def addPlay(play, symbol)
    @@plays[play] = symbol
  end

  def checkPlayExists(play)
    @@plays.key?(play)
  end

end
