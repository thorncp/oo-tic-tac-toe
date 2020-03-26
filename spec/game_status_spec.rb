require_relative "../lib/game_status"
require_relative "../lib/grid"

RSpec.describe GameStatus do
  describe "#computer_won?" do
    it "is true when the computer claims a row" do
      grid = Grid.new(
        "A1" => "O", "A2" => "O", "A3" => "O",
        "B1" => "X", "B2" => "X"
      )
      status = GameStatus.new(grid: grid)

      expect(status).to be_computer_won
    end

    it "is true when the computer claims a column" do
      grid = Grid.new(
        "A1" => "O", "A2" => "X",
        "B1" => "O", "B2" => "X",
        "C1" => "O"
      )
      status = GameStatus.new(grid: grid)

      expect(status).to be_computer_won
    end

    it "is true when the computer claims a diagonal" do
      grid = Grid.new(
        "A1" => "O",
        "B1" => "X", "B2" => "O",
        "C1" => "X", "C2" => "X", "C3" => "O"
      )
      status = GameStatus.new(grid: grid)

      expect(status).to be_computer_won
    end

    it "is false when the computer doesn't have three cells in a row" do
      grid = Grid.new(
        "A1" => "O",
        "B1" => "X", "B2" => "O",
        "C1" => "O", "C2" => "X"
      )
      status = GameStatus.new(grid: grid)

      expect(status).not_to be_computer_won
    end
  end

  describe "#game_over?" do
    it "is true when the grid is full" do
      grid = Grid.new(
        "A1" => "X", "A2" => "X", "A3" => "O",
        "B1" => "O", "B2" => "O", "B3" => "X",
        "C1" => "X", "C2" => "O", "C3" => "X"
      )
      status = GameStatus.new(grid: grid)

      expect(status).to be_game_over
    end

    it "is true when the player has won" do
      grid = Grid.new(
        "A1" => "X", "A2" => "X", "A3" => "X",
        "B1" => "O", "B2" => "O"
      )
      status = GameStatus.new(grid: grid)

      expect(status).to be_game_over
    end

    it "is true when the computer has won" do
      grid = Grid.new(
        "A1" => "O", "A2" => "O", "A3" => "O",
        "B1" => "X", "B2" => "X"
      )
      status = GameStatus.new(grid: grid)

      expect(status).to be_game_over
    end

    it "is false when there is no winner and cells are available" do
      grid = Grid.new(
        "A1" => "O", "A2" => "X", "A3" => "O",
        "B1" => "X", "B2" => "X"
      )
      status = GameStatus.new(grid: grid)

      expect(status).not_to be_game_over
    end
  end

  describe "#player_won?" do
    it "is true when the player claims a row" do
      grid = Grid.new(
        "A1" => "X", "A2" => "X", "A3" => "X",
        "B1" => "O", "B2" => "O"
      )
      status = GameStatus.new(grid: grid)

      expect(status).to be_player_won
    end

    it "is true when the player claims a column" do
      grid = Grid.new(
        "A1" => "X", "A2" => "O",
        "B1" => "X", "B2" => "O",
        "C1" => "X"
      )
      status = GameStatus.new(grid: grid)

      expect(status).to be_player_won
    end

    it "is true when the player claims a diagonal" do
      grid = Grid.new(
        "A1" => "X",
        "B1" => "O", "B2" => "X",
        "C1" => "O", "C2" => "O", "C3" => "X"
      )
      status = GameStatus.new(grid: grid)

      expect(status).to be_player_won
    end

    it "is false when the player doesn't have three cells in a row" do
      grid = Grid.new(
        "A1" => "X",
        "B1" => "O", "B2" => "X",
        "C1" => "X", "C2" => "O"
      )
      status = GameStatus.new(grid: grid)

      expect(status).not_to be_player_won
    end
  end

  describe "#tied?" do
    it "is true when the grid is full" do
      grid = double(full?: true)
      status = GameStatus.new(grid: grid)

      expect(status).to be_tied
    end

    it "is false when the grid is not full" do
      grid = double(full?: false)
      status = GameStatus.new(grid: grid)

      expect(status).not_to be_tied
    end
  end
end
