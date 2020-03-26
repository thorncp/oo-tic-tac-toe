class Grid
  attr_reader :cells

  def self.valid_coordinates
    %w[A1 A2 A3 B1 B2 B3 C1 C2 C3]
  end

  def initialize(cells = {})
    @cells = cells
  end

  def full?
    cells.size == valid_coordinates.size
  end

  def computer_coordinates
    cells.select { |_, value| value == "O" }.keys
  end

  def player_coordinates
    cells.select { |_, value| value == "X" }.keys
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
    coordinates_in_grid?(coordinates) && coordinates_unmarked?(coordinates)
  end

  private

  def available_coordinates
    valid_coordinates - cells.keys
  end

  def valid_coordinates
    self.class.valid_coordinates
  end

  def coordinates_in_grid?(coordinates)
    valid_coordinates.include?(coordinates)
  end

  def coordinates_unmarked?(coordinates)
    available_coordinates.include?(coordinates)
  end
end
