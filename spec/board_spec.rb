require './board'

RSpec.describe Board do
  describe "#positions" do
    it "return total board positions" do
      board = Board.new(3,4)
      board.totalPositions
      expect(board.totalPositions).to eq 12
    end
  end
end
