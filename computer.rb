require './player'

class Computer < Player
  def play
    return Random.rand(4)
  end
end
