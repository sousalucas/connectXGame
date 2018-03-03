require './game'

RSpec.describe Board do
  describe "#check game play" do
    it "verify if play 1 and 2 is already set" do
      game = Game.new
      game.addPlay(1, 'x')
      game.addPlay(2, 'x')
      expect(game.checkPlayExists(1)).to be_truthy
      expect(game.checkPlayExists(2)).to be_truthy
    end
    it "verify if play 3 and 4 do not exists yet" do
      game = Game.new
      game.addPlay(1, 'x')
      game.addPlay(2, 'y')
      expect(game.checkPlayExists(3)).to be_falsey
      expect(game.checkPlayExists(4)).to be_falsey
    end
  end
end
