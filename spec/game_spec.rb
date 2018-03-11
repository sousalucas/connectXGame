require './game'

RSpec.describe Game do
  context "#check game end" do
    it "verify if game is over" do
      game = Game.new
      game.addPlay(2, 'x')
      game.addPlay(3, 'y')
      expect(game.isWinningPlay(4,'x')).to be_falsey
    end
  end
  context "#check game not end" do
    it "vadasd aooad aiaisdr" do
      game = Game.new
      game.addPlay(2, 'x')
      game.addPlay(3, 'x')
      expect(game.isWinningPlay(4,'x')).to be_truthy
    end
  end
end
