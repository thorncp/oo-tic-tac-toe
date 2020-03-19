class Grid
  attr_reader :cells

  def initialize(cells = {})
    @cells = cells
  end

  def mark(coordinates:, value:)
    cells[coordinates] = value
  end

  def value(coordinates)
    cells[coordinates]
  end
end
