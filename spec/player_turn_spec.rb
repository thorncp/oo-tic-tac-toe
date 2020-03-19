require_relative "../lib/grid"
require_relative "../lib/player_turn"

RSpec.describe PlayerTurn do
  describe "#take" do
    it "gets payer input and updates the grid" do
      grid = Grid.new
      player_input = double
      allow(player_input).to receive(:get_coordinates).and_return("A1")
      player_turn = PlayerTurn.new(grid: grid, player_input: player_input)

      player_turn.take

      expect(grid.value("A1")).to eq "X"
    end
  end
end
