require_relative "../lib/game"

RSpec.describe Game do
  it "prints a grid" do
    stdin = StringIO.new
    stdout = StringIO.new
    game = Game.new(input: stdin, output: stdout)
    allow(stdin).to receive(:gets).and_return("R2", "3PO", "C1")

    game.play

    expect(stdout.string.strip).to eq(<<~GRID.strip)
         1  2  3
         __ __ __
      A |  |  |  |
        |__|__|__|
      B |  |  |  |
        |__|__|__|
      C |  |  |  |
        |__|__|__|
      Enter your move >
      Invalid coordinates 'R2'

      Enter your move >
      Invalid coordinates '3PO'

      Enter your move >
         1  2  3
         __ __ __
      A |  |  |  |
        |__|__|__|
      B |  |  |  |
        |__|__|__|
      C |X |  |  |
        |__|__|__|
    GRID
  end
end
