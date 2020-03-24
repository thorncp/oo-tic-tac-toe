require_relative "../lib/grid"

RSpec.describe Grid do
  describe "#mark_computer" do
    it "assigns O to the given coordinates" do
      grid = Grid.new

      grid.mark_computer(coordinates: "A1")

      expect(grid.value("A1")).to eq "O"
    end
  end

  describe "#mark_player" do
    it "assigns X to the given coordinates" do
      grid = Grid.new

      grid.mark_player(coordinates: "A1")

      expect(grid.value("A1")).to eq "X"
    end
  end

  describe "#random_coordinates" do
    it "returns random coordinates from the available ones" do
      srand(0)
      grid = Grid.new("A1" => "X", "B2" => "O", "C3" => "X")

      expect(grid.random_coordinates).to eq "C1"
    end

    it "is nil when all coordinates have been used" do
      grid = Grid.new(
        "A1" => "X",
        "A2" => "X",
        "A3" => "X",
        "B1" => "O",
        "B2" => "O",
        "B3" => "O",
        "C1" => "X",
        "C2" => "X",
        "C3" => "X"
      )

      expect(grid.random_coordinates).to be_nil
    end
  end

  describe "#valid_coordinates?" do
    it "is true when the value is in the grid" do
      expect(Grid.new.valid_coordinates?("A1")).to be true
      expect(Grid.new.valid_coordinates?("B2")).to be true
      expect(Grid.new.valid_coordinates?("C3")).to be true
    end

    it "is false when in a row after the last row in the grid" do
      expect(Grid.new.valid_coordinates?("D2")).to be false
    end

    it "is false when in a column before the first column in the grid" do
      expect(Grid.new.valid_coordinates?("C0")).to be false
    end

    it "is false when in a column after the last column of the grid" do
      expect(Grid.new.valid_coordinates?("B4")).to be false
    end

    it "is false when the the coordinates don't match the pattern" do
      expect(Grid.new.valid_coordinates?("@1")).to be false
    end
  end

  describe "#value" do
    it "returns the value at the given coordinates" do
      grid = Grid.new("C3" => "X")

      expect(grid.value("C3")).to eq "X"
    end
  end
end
