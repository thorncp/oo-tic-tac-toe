class GridView
  attr_reader :output

  def initialize(output:)
    @output = output
  end

  def render
    output.puts(template)
  end

  private

  def template
    @template ||= File.read("lib/grid.txt")
  end
end
