require_relative "text_view"

class PlayerTurn
  attr_reader :player_input, :grid

  def initialize(player_input:, grid:)
    @player_input = player_input
    @grid = grid
  end

  def take
    mark_grid(get_player_coordinates)
  end

  private

  def mark_grid(coordinates)
    grid.mark(coordinates: coordinates, value: "X")
  end

  def get_player_coordinates
    player_input.get_coordinates
  end
end
