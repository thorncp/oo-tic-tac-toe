require_relative "../lib/game"

RSpec.describe Game do
  it "prints a grid" do
    stdout = StringIO.new
    game = Game.new(output: stdout)

    game.play

    expect(stdout.string).to include <<~GRID
       __ __ __
      |  |  |  |
      |__|__|__|
      |  |  |  |
      |__|__|__|
      |  |  |  |
      |__|__|__|
    GRID
  end
end
