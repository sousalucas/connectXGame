class Player
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def getName
    return @name
  end

  def getSymbol
    return @symbol
  end

  def play
    puts "#{@name} Type a column number"
    return gets.to_i
  end
end
