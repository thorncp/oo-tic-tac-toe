require_relative "../lib/null_coordinates"

RSpec.describe NullCoordinates do
  describe "#value" do
    it "is nil" do
      expect(NullCoordinates.new.value).to be_nil
    end
  end

  describe "#valid?" do
    it "is false" do
      expect(NullCoordinates.new).not_to be_valid
    end
  end

  describe "#to_s" do
    it "is empty" do
      expect(NullCoordinates.new.to_s).to be_empty
    end
  end
end
