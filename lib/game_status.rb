require "set"

class GameStatus
  attr_reader :grid

  def initialize(grid:)
    @grid = grid
  end

  def game_over?
    computer_won? || player_won? || tied?
  end

  def computer_won?
    winner?(grid.computer_coordinates)
  end

  def player_won?
    winner?(grid.player_coordinates)
  end

  def tied?
    grid.full?
  end

  private

  def winner?(marked_coordinates)
    winning_combinations.any? { |combination|
      combination.subset?(marked_coordinates.to_set)
    }
  end

  def winning_combinations
    rows + columns + diagonals
  end

  def rows
    [
      Set.new(%w[A1 A2 A3]),
      Set.new(%w[B1 B2 B3]),
      Set.new(%w[C1 C2 C3])
    ]
  end

  def columns
    [
      Set.new(%w[A1 B1 C1]),
      Set.new(%w[A2 B2 C2]),
      Set.new(%w[A3 B3 C3])
    ]
  end

  def diagonals
    [
      Set.new(%w[A1 B2 C3]),
      Set.new(%w[A3 B2 C1])
    ]
  end
end
