require_relative "../lib/game"

RSpec.describe Game do
  it "prints a grid" do
    stdout = StringIO.new
    game = Game.new(output: stdout)

    game.play

    expect(stdout.string).to include <<~GRID
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
