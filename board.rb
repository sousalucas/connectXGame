class Board

  attr_reader :columns

  def initialize(columns, rows)
    @columns = columns
    @rows = rows
  end

  def totalPositions
    return @columns*@rows
  end

  def draw(playsHash)
    i=0
    while i < @rows
      j=0
      k=0
      while j < @columns
        print '-----'
        j+=1
      end
      puts
      j=0
      while j < @columns
        currentPosition = ((i*10)+k+1)
        if playsHash.key?(currentPosition)
          print '| ' + playsHash[currentPosition] + ' |'
        else
          print '|   |'
        end
        j+=1
        k+=1
      end
      puts
      j=0
      while j < @columns
        print '-----'
        j+=1
      end
      puts
      i+=1
    end
  end

end
