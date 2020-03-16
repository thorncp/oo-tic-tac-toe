require_relative "grid_view"
require_relative "player_turn"
require_relative "text_view"

class Game
  def initialize(input:, output:)
    @input = input
    @output = output
  end

  def play
    grid_view.render
    get_player_input
  end

  private

  attr_reader :input, :output

  def get_player_input
    player_turn.get_coordinates
  end

  def player_turn
    PlayerTurn.new(input: input, view: text_view)
  end

  def grid_view
    @grid_view ||= GridView.new(output: output)
  end

  def text_view
    @text_view ||= TextView.new(output: output)
  end
end
