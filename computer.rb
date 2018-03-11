require './player'

class Computer < Player

  def initialize(name, symbol, columns)
    @name = name
    @symbol = symbol
    @columns = columns
  end

  def play
    return Random.rand(@columns+1)
  end
end
