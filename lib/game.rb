class Game
  CLI_GRID = <<~GRID.freeze
     __ __ __
    |  |  |  |
    |__|__|__|
    |  |  |  |
    |__|__|__|
    |  |  |  |
    |__|__|__|
  GRID

  def initialize(output:)
    @output = output
  end

  def play
    output.puts(CLI_GRID)
  end

  private

  attr_reader :output
end
