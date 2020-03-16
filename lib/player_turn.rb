require_relative "coordinates"
require_relative "null_coordinates"

class PlayerTurn
  attr_reader :input, :view

  def initialize(input:, view:)
    @input = input
    @view = view
  end

  def get_coordinates
    until coordinates.valid?
      get_and_validate_coordinates
    end
    coordinates.value
  end

  private

  def coordinates
    @coordinates || NullCoordinates.new
  end

  def get_and_validate_coordinates
    view.render_coordinates_prompt
    get_input
    unless coordinates.valid?
      view.render_coordinates_error(coordinates)
    end
  end

  def get_input
    @coordinates = Coordinates.new(value: input.gets.chomp)
  end
end
