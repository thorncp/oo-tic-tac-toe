require_relative "../lib/grid"

RSpec.describe Grid do
  describe "#mark" do
    it "updates the given cell" do
      grid = Grid.new

      grid.mark(coordinates: "A1", value: "X")

      expect(grid.value("A1")).to eq "X"
    end
  end

  describe "#value" do
    it "returns the value at the given coordinates" do
      grid = Grid.new("C3" => "X")

      expect(grid.value("C3")).to eq "X"
    end
  end
end
