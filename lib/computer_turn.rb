class ComputerTurn
  attr_reader :grid, :view

  def initialize(grid:, view:)
    @grid = grid
    @view = view
  end

  def take
    view.render_computer_thinking
    mark_random_cell
  end

  private

  def mark_random_cell
    grid.mark_computer(coordinates: random_coordinates)
  end

  def random_coordinates
    grid.random_coordinates
  end
end
