require './game'

system 'clear'

game = Game.new
game.prepareGame

while not false
  system 'clear'
  game.drawBoard
  game.play
end


# puts "Total Board Positions: " + "#{b.totalPositions}"


# player = Player.new
# puts player.getName
#
# human = Human.new
# puts human.getName
# computer = Computer.new
# puts computer.getName

# b = Board.new(4,4)
#
# system 'clear'
# puts "Total Board Positions: " + "#{b.totalPositions}"
# b.draw([])
