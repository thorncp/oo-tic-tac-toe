class Grid
  attr_reader :cells

  def self.valid_coordinates
    %w[A1 A2 A3 B1 B2 B3 C1 C2 C3]
  end

  def initialize(cells = {})
    @cells = cells
  end

  def mark_computer(coordinates:)
    cells[coordinates] = "O"
  end

  def mark_player(coordinates:)
    cells[coordinates] = "X"
  end

  def random_coordinates
    available_coordinates.sample
  end

  def value(coordinates)
    cells[coordinates]
  end

  def valid_coordinates?(coordinates)
    valid_coordinates.include?(coordinates)
  end

  private

  def available_coordinates
    valid_coordinates - cells.keys
  end

  def valid_coordinates
    self.class.valid_coordinates
  end
end
