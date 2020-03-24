class GridView
  attr_reader :grid, :output

  def initialize(grid:, output:)
    @grid = grid
    @output = output
  end

  def render
    output.puts(rendered_template)
  end

  private

  def rendered_template
    template.gsub(/[A-Z]\d/) { |match| cell(match) }
  end

  def template
    @template ||= File.read("lib/grid.txt")
  end

  def cell(coordinates)
    grid.value(coordinates) || " "
  end
end
