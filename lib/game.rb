class Game
  CLI_GRID = <<~GRID.freeze
       1  2  3
       __ __ __
    A |  |  |  |
      |__|__|__|
    B |  |  |  |
      |__|__|__|
    C |  |  |  |
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
