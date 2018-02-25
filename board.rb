class Board
  def initialize(columns, rows)
    @columns = columns
    @rows = rows
  end

  def totalPositions
    return @columns*@rows
  end

  def draw(contentArray = [])
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
        if contentArray.include? (i*10)+k
          print '| o |'
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
