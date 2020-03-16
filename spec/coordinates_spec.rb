require_relative "../lib/coordinates"

RSpec.describe Coordinates do
  describe "#valid?" do
    it "is true when the value is in the grid" do
      expect(Coordinates.new(value: "A1")).to be_valid
      expect(Coordinates.new(value: "B2")).to be_valid
      expect(Coordinates.new(value: "C3")).to be_valid
    end

    it "is false when in a row before the first row of the grid" do
      expect(Coordinates.new(value: "@1")).not_to be_valid
    end

    it "is false when in a row after the last row in the grid" do
      expect(Coordinates.new(value: "C0")).not_to be_valid
    end

    it "is false when in a column before the first column in the grid" do
      expect(Coordinates.new(value: "C0")).not_to be_valid
    end

    it "is false when in a column after the last column of the grid" do
      expect(Coordinates.new(value: "B4")).not_to be_valid
    end
  end

  describe "#to_s" do
    it "returns the underlying string" do
      coordinates = Coordinates.new(value: "foo")

      expect(coordinates.to_s).to eq "foo"
    end
  end
end
