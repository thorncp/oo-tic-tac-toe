require_relative "../lib/grid_view"

RSpec.describe GridView do
  it "renders a grid to output" do
    output = StringIO.new
    view = described_class.new(output: output)

    view.render

    expect(output.string.strip).to eq <<~GRID.strip
         1  2  3
         __ __ __
      A |  |  |  |
        |__|__|__|
      B |  |  |  |
        |__|__|__|
      C |  |  |  |
        |__|__|__|
    GRID
  end
end
