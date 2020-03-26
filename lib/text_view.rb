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

  def render_game_over
    output.puts(<<~GG)

      Game Over!
    GG
  end
end
