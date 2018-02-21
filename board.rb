class Board
  def initialize(columns, rows)
    @columns = columns
    @rows = rows
  end

  def totalPositions
    puts "Total is #{@columns*@rows}"
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
        if contentArray[i*k]
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
