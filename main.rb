require './game'

system 'clear'

game = Game.new
game.prepareGame

while not game.endGame
  game.drawBoard
  game.play
end

game.drawBoard

if(game.winner)
  puts 'WINNER !!!'
else
  puts 'Tied !'
end
puts '** END OF GAME **'
