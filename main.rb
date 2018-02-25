require './game'
require './board'
require './human'
require './computer'

system 'clear'

game = Game.new
game.start

b = Board.new(4,4)
#
# system 'clear'
# puts "Total Board Positions: " + "#{b.totalPositions}"
b.draw([])


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
