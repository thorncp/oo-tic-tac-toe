require_relative "grid"
require_relative "grid_view"
require_relative "player_input"
require_relative "player_turn"
require_relative "text_view"

class Game
  def initialize(input:, output:)
    @input = input
    @output = output
    @grid = Grid.new
  end

  def play
    grid_view.render
    player_turn.take
    grid_view.render
  end

  private

  attr_reader :grid, :input, :output

  def player_turn
    PlayerTurn.new(player_input: player_input, grid: grid)
  end

  def player_input
    PlayerInput.new(input: input, view: text_view)
  end

  def grid_view
    GridView.new(output: output, grid: grid)
  end

  def text_view
    TextView.new(output: output)
  end
end
