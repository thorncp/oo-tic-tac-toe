require_relative "computer_turn"
require_relative "computer_won"
require_relative "game_status"
require_relative "game_tied"
require_relative "grid"
require_relative "grid_view"
require_relative "player_input"
require_relative "player_turn"
require_relative "player_won"
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
    until status.game_over?
      take_player_turn
      take_computer_turn
    end
  end

  def take_player_turn
    player_turn.take
    grid_view.render
  end

  def take_computer_turn
    return if status.game_over?
    computer_turn.take
    grid_view.render
  end

  def bid_farewell
    end_games.find(&:current?).render
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

  def end_games
    [
      ComputerWon.new(status: status, text_view: text_view),
      GameTied.new(status: status, text_view: text_view),
      PlayerWon.new(status: status, text_view: text_view)
    ]
  end

  def status
    GameStatus.new(grid: grid)
  end
end
