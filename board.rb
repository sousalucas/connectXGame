class Board

  attr_reader :columns
  attr_reader :rows
  attr_reader :factor

  attr_writer :winningPlay

  def initialize(columns, rows)
    @columns = columns
    @rows = rows
    @winningPlay = nil
    @factor = 100
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
        currentPosition = ((i*@factor)+k+1)
        if playsHash.key?(currentPosition)
          if @winningPlay == currentPosition
            print '{ ' + playsHash[currentPosition] + ' }'
          else
            print '| ' + playsHash[currentPosition] + ' |'
          end
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
