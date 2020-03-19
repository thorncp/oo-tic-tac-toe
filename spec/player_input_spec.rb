require_relative "../lib/player_input"

RSpec.describe PlayerInput do
  describe "#get_coordinates" do
    it "returns the user's input if valid" do
      input = double
      mock_view = double(
        render_coordinates_prompt: nil,
        render_coordinates_error: nil
      )
      player_turn = PlayerInput.new(input: input, view: mock_view)
      allow(input).to receive(:gets).and_return("A1")

      result = player_turn.get_coordinates

      expect(result).to eq("A1")
    end

    it "prompts for input until valid coordinates are entered" do
      input = double
      mock_view = double(
        render_coordinates_prompt: nil,
        render_coordinates_error: nil
      )
      player_turn = PlayerInput.new(input: input, view: mock_view)
      allow(input).to receive(:gets).and_return("A0", "A4", "A1")

      player_turn.get_coordinates

      expect(mock_view).to have_received(:render_coordinates_prompt)
        .exactly(3).times
      expect(mock_view).to have_received(:render_coordinates_error).twice
    end
  end
end
