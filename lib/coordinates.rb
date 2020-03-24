class Coordinates
  attr_reader :grid, :value

  def initialize(grid:, value:)
    @grid = grid
    @value = value
  end

  def valid?
    grid.valid_coordinates?(value)
  end

  def to_s
    value
  end
end
