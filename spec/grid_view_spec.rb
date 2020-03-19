require_relative "../lib/grid"
require_relative "../lib/grid_view"

RSpec.describe GridView do
  it "renders a grid to output" do
    output = StringIO.new
    grid = Grid.new("B2" => "X", "C3" => "O")
    view = GridView.new(grid: grid, output: output)

    view.render

    expect(output.string.strip).to eq <<~GRID.strip
         1  2  3
         __ __ __
      A |  |  |  |
        |__|__|__|
      B |  |X |  |
        |__|__|__|
      C |  |  |O |
        |__|__|__|
    GRID
  end
end
