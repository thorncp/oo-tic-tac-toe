require_relative "../lib/game"

RSpec.describe Game do
  it "prints an error on invalid coordinates" do
    stdin = StringIO.new
    stdout = StringIO.new
    grid = Grid.new(
      "A1" => "X", "A2" => "O", "A3" => "X",
      "B1" => "O", "B2" => "X", "B3" => "O",
      "C1" => "O", "C2" => "X"
    )
    game = Game.new(input: stdin, output: stdout, grid: grid)
    allow(stdin).to receive(:gets).and_return("R2", "3PO", "C3")

    game.play

    expect(stdout.string).to include "Invalid coordinates 'R2'"
    expect(stdout.string).to include "Invalid coordinates '3PO'"
  end

  it "alternates between player turn and computer turn" do
    srand(0)
    stdin = StringIO.new
    stdout = StringIO.new
    grid = Grid.new(
      "A1" => "X", "A2" => "O", "A3" => "X",
      "B1" => "O", "B2" => "X", "B3" => "O"
    )
    game = Game.new(input: stdin, output: stdout, grid: grid)
    allow(stdin).to receive(:gets).and_return("C2", "C3")

    game.play

    expect(stdout.string).to include <<~GAME
      Enter your move >
         1  2  3
         __ __ __
      A |X |O |X |
        |__|__|__|
      B |O |X |O |
        |__|__|__|
      C |  |X |  |
        |__|__|__|

      Thinking...

         1  2  3
         __ __ __
      A |X |O |X |
        |__|__|__|
      B |O |X |O |
        |__|__|__|
      C |O |X |  |
        |__|__|__|
      Enter your move >
         1  2  3
         __ __ __
      A |X |O |X |
        |__|__|__|
      B |O |X |O |
        |__|__|__|
      C |O |X |X |
        |__|__|__|
    GAME
  end

  it "introduces the game by printing the grid" do
    stdin = StringIO.new
    stdout = StringIO.new
    grid = Grid.new(
      "A1" => "X", "A2" => "X", "A3" => "X",
      "B1" => "O", "B2" => "O", "B3" => "O",
      "C1" => "X", "C2" => "X", "C3" => "X"
    )
    game = Game.new(input: stdin, output: stdout, grid: grid)

    game.play

    expect(stdout.string).to include <<~GAME
         1  2  3
         __ __ __
      A |X |X |X |
        |__|__|__|
      B |O |O |O |
        |__|__|__|
      C |X |X |X |
        |__|__|__|
    GAME
  end

  it "prints game over when the player wins" do
    stdin = StringIO.new
    stdout = StringIO.new
    grid = Grid.new(
      "A1" => "X", "A2" => "O",
      "B1" => "X", "B2" => "O",
      "C1" => "X"
    )
    game = Game.new(input: stdin, output: stdout, grid: grid)

    game.play

    expect(stdout.string).to include "Game Over - You won :)"
  end

  it "prints game over when the computer wins" do
    stdin = StringIO.new
    stdout = StringIO.new
    grid = Grid.new(
      "A1" => "X", "A2" => "X", "A3" => "O",
      "B1" => "X", "B2" => "O",
      "C1" => "O"
    )
    game = Game.new(input: stdin, output: stdout, grid: grid)

    game.play

    expect(stdout.string).to include "Game Over - You lost :("
  end

  it "prints game over when the grid is full" do
    stdin = StringIO.new
    stdout = StringIO.new
    grid = Grid.new(
      "A1" => "X", "A2" => "X", "A3" => "O",
      "B1" => "O", "B2" => "O", "B3" => "X",
      "C1" => "X", "C2" => "O", "C3" => "X"
    )
    game = Game.new(input: stdin, output: stdout, grid: grid)

    game.play

    expect(stdout.string).to include "Game Over - It's a tie :|"
  end
end
