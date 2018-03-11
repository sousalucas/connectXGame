require './game'

RSpec.describe Game do
  context "#check play not winning" do
    it "play not winning" do
      game = Game.new
      game.addPlay(2, 'x')
      game.addPlay(3, 'y')
      expect(game.isWinningPlay(4,'x')).to be_falsey
    end
  end
  context "#check winning play" do
    it "play winning" do
      game = Game.new
      game.addPlay(2, 'x')
      game.addPlay(3, 'x')
      expect(game.isWinningPlay(4,'x')).to be_truthy
    end
  end
  context "#check end game tied" do
    it "end game tied" do
      game = Game.new
      game.addPlay(2, 'x')
      game.addPlay(3, 'x')
      expect(game.isWinningPlay(4,'x')).to be_falsey
      expect(game.isFullBoard).to be_truthy
      expect(game.endGame).to be_truthy
    end
  end
end
