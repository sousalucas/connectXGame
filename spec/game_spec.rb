require './game'

RSpec.describe Game do

  before(:each) do
    @game = Game.new
  end

  context "#check play not winning" do
    it "play not winning" do
      @game.addPlay(1, 'x')
      @game.addPlay(2, 'x')
      @game.addPlay(3, 'y')
      expect(@game.isWinningPlay(4,'x')).to be_falsey
    end
  end

  context "check winning play" do
    it "play winning" do
      @game.addPlay(4, 'x')
      @game.addPlay(5, 'x')
      @game.addPlay(6, 'x')
      expect(@game.isWinningPlay(7,'x')).to be_truthy
    end
  end

  context "check full board" do
    it "end game tied" do
      [*0...@game.board.rows].each do |r|
        [*1..@game.board.columns].each do |c|
          @game.addPlay(r*@game.board.factor+c, 'y')
        end
      end

      expect(@game.isFullBoard).to be_truthy
    end
  end
end
