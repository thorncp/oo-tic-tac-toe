require_relative "computer_turn"
require_relative "grid"
require_relative "grid_view"
require_relative "player_input"
require_relative "player_turn"
require_relative "text_view"

class Game
  def initialize(input:, output:, grid: Grid.new)
    @input = input
    @output = output
    @grid = grid
  end

  def play
    introduce_the_game
    play_to_completion
    bid_farewell
  end

  private

  attr_reader :grid, :input, :output

  def introduce_the_game
    grid_view.render
  end

  def play_to_completion
    until grid.full?
      take_player_turn
      take_computer_turn
    end
  end

  def take_player_turn
    player_turn.take
    grid_view.render
  end

  def take_computer_turn
    return if grid.full?
    computer_turn.take
    grid_view.render
  end

  def bid_farewell
    text_view.render_game_over
  end

  def player_turn
    PlayerTurn.new(player_input: player_input, grid: grid)
  end

  def player_input
    PlayerInput.new(input: input, grid: grid, view: text_view)
  end

  def computer_turn
    ComputerTurn.new(grid: grid, view: text_view)
  end

  def grid_view
    GridView.new(output: output, grid: grid)
  end

  def text_view
    TextView.new(output: output)
  end
end
