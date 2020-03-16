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
end
