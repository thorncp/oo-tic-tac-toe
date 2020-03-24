require_relative "../lib/coordinates"

RSpec.describe Coordinates do
  describe "#valid?" do
    it "is true when the grid validates it to be" do
      grid = double(valid_coordinates?: true)
      coordinates = Coordinates.new(value: "A1", grid: grid)

      expect(coordinates).to be_valid
    end

    it "is false when the grid validates it to be" do
      grid = double(valid_coordinates?: false)
      coordinates = Coordinates.new(value: "A1", grid: grid)

      expect(coordinates).not_to be_valid
    end
  end

  describe "#to_s" do
    it "returns the underlying string" do
      coordinates = Coordinates.new(value: "foo", grid: double)

      expect(coordinates.to_s).to eq "foo"
    end
  end
end
