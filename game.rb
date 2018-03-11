require './human'
require './computer'
require './board'

class Game

  attr_reader :endGame
  attr_reader :hasWinner
  attr_reader :plays
  attr_reader :board

  GAME_TYPE_CONST     = [1,2,3]
  GAME_NUMBER_CONNECT = 4

  def initialize
    @endGame    = false
    @hasWinner  = false
    @plays      = Hash.new
    @players    = Array.new
    @board      = Board.new(7,6)
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
        self.addPlayer(Human.new('Human', 'o'))
        self.addPlayer(Computer.new('Computer', 'x', @board.columns))
      when 2
        self.addPlayer(Human.new('Human 1', 'o'))
        self.addPlayer(Human.new('Human 2', 'x'))
      when 3
        self.addPlayer(Computer.new('Computer 1', 'o', @board.columns))
        self.addPlayer(Computer.new('Computer 2', 'x', @board.columns))
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
    @players << player
  end

  def play
    @players.each do |p|
      column = p.play
      play = getSpotAvaiableByColumn(column)
      while (play < 0 or not isValidPlay(column))
        puts "Invalid Play, try again..."
        column = p.play
        play = getSpotAvaiableByColumn(column)
      end
      self.addPlay(play, p.getSymbol)
      break if self.isWinningPlay(play, p.getSymbol)
      break if self.isFullBoard
      self.drawBoard
    end
  end

  def drawBoard
    system 'clear'
    @board.draw(@plays)
  end

  def addPlay(position, symbol)
    @plays[position] = symbol
  end

  def isValidPlay(play)
    if (play > 0 and play <= @board.columns)
      return true
    else
      return false
    end
  end

  def getSpotAvaiableByColumn(column)
    [*0...@board.rows].reverse_each do |r|
      play = column + (r * @board.factor);
      if not @plays.key?(play)
        return play
      end
    end
    return -1
  end

  def isWinningPlay(play, symbol)
    #check next plays
    total = 0;
    [*1...GAME_NUMBER_CONNECT].each do |searchPlay|
      searchKey = play+searchPlay
      if @plays.key?(searchKey) and @plays[searchKey] == symbol
        total += 1
      end
    end

    if total >= (GAME_NUMBER_CONNECT - 1)
      @board.winningPlay = play
      return @endGame = @hasWinner = true
    end

    #check previous plays
    [*1...GAME_NUMBER_CONNECT].each do |searchPlay|
      searchKey = play-searchPlay
      if @plays.key?(searchKey) and @plays[searchKey] == symbol
        total += 1
      end
    end

    if total >= (GAME_NUMBER_CONNECT - 1)
      @board.winningPlay = play
      return @endGame = @hasWinner = true
    end

    #check top plays
    total = 0;
    [*1...GAME_NUMBER_CONNECT].each do |searchPlay|
      searchKey = play+(searchPlay*@board.factor)
      if @plays.key?(searchKey) and @plays[searchKey] == symbol
        total += 1
      end
    end

    if total >= (GAME_NUMBER_CONNECT - 1)
      @board.winningPlay = play
      return @endGame = @hasWinner = true
    end

    #check diagonal 1 plays
    total = 0;
    [*1...GAME_NUMBER_CONNECT].each do |searchPlay|
      searchKey = play+((searchPlay*@board.factor)+searchPlay)
      if @plays.key?(searchKey) and @plays[searchKey] == symbol
        total += 1
      end
    end

    if total >= (GAME_NUMBER_CONNECT - 1)
      @board.winningPlay = play
      return @endGame = @hasWinner = true
    end

    #check diagonal 2 plays
    [*1...GAME_NUMBER_CONNECT].each do |searchPlay|
      searchKey = play+((searchPlay*@board.factor)-searchPlay)
      if @plays.key?(searchKey) and @plays[searchKey] == symbol
        total += 1
      end
    end

    if total >= (GAME_NUMBER_CONNECT - 1)
      @board.winningPlay = play
      return @endGame = @hasWinner = true
    end

    return false

  end

  def isFullBoard()
    if ((@board.rows * @board.columns) == @plays.length)
      return @endGame = true
    end
    return false
  end

end
