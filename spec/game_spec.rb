require_relative "../lib/game"

RSpec.describe Game do
  it "prints a grid" do
    srand(0)
    stdin = StringIO.new
    stdout = StringIO.new
    game = Game.new(input: stdin, output: stdout)
    allow(stdin).to receive(:gets)
      .and_return("R2", "3PO", "C1", "A3", "A1", "B1", "B3")

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

      Thinking...

         1  2  3
         __ __ __
      A |  |  |  |
        |__|__|__|
      B |  |O |  |
        |__|__|__|
      C |X |  |  |
        |__|__|__|
      Enter your move >
         1  2  3
         __ __ __
      A |  |  |X |
        |__|__|__|
      B |  |O |  |
        |__|__|__|
      C |X |  |  |
        |__|__|__|

      Thinking...

         1  2  3
         __ __ __
      A |  |  |X |
        |__|__|__|
      B |  |O |  |
        |__|__|__|
      C |X |  |O |
        |__|__|__|
      Enter your move >
         1  2  3
         __ __ __
      A |X |  |X |
        |__|__|__|
      B |  |O |  |
        |__|__|__|
      C |X |  |O |
        |__|__|__|

      Thinking...

         1  2  3
         __ __ __
      A |X |O |X |
        |__|__|__|
      B |  |O |  |
        |__|__|__|
      C |X |  |O |
        |__|__|__|
      Enter your move >
         1  2  3
         __ __ __
      A |X |O |X |
        |__|__|__|
      B |X |O |  |
        |__|__|__|
      C |X |  |O |
        |__|__|__|

      Thinking...

         1  2  3
         __ __ __
      A |X |O |X |
        |__|__|__|
      B |X |O |  |
        |__|__|__|
      C |X |O |O |
        |__|__|__|
      Enter your move >
         1  2  3
         __ __ __
      A |X |O |X |
        |__|__|__|
      B |X |O |X |
        |__|__|__|
      C |X |O |O |
        |__|__|__|

      Game Over!
    GRID
  end
end
