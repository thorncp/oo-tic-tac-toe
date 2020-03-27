class TextView
  attr_reader :output

  def initialize(output:)
    @output = output
  end

  def render_coordinates_prompt
    output.write("Enter your move >")
  end

  def render_coordinates_error(coordinates)
    output.puts(<<~ERROR)

      Invalid coordinates '#{coordinates}'

    ERROR
  end

  def render_computer_thinking
    output.puts(<<~BRAINS)

      Thinking...
    BRAINS
  end

  def render_computer_won
    output.puts(<<~GG)

      Game Over - You lost :(
    GG
  end

  def render_player_won
    output.puts(<<~GG)

      Game Over - You won :)
    GG
  end

  def render_tie
    output.puts(<<~GG)

      Game Over - It's a tie :|
    GG
  end
end
