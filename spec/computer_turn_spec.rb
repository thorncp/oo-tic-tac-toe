require_relative "../lib/computer_turn"
require_relative "../lib/grid"

RSpec.describe ComputerTurn do
  describe "#take" do
    it "marks a random grid cell with O" do
      srand(0)
      grid = Grid.new
      view = double(render_computer_thinking: nil)
      computer_turn = ComputerTurn.new(grid: grid, view: view)

      computer_turn.take

      expect(grid.value("B3")).to eq "O"
    end
  end
end
