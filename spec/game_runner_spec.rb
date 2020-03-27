require "open3"

RSpec::Matchers.define :have_printed do |expected|
  match do |actual|
    @actual = actual.read(expected.length)
    expect(@actual).to eq(expected)
  end

  diffable
end

RSpec.describe "playing the game" do
  it "uses a grid based CLI" do
    stdin, stdout, _ = Open3.popen2(
      {"SEED" => "1", "LANG" => "en_US.UTF-8"},
      "ruby game_runner.rb"
    )

    expect(stdout).to have_printed <<~GRID

         1  2  3
         __ __ __
      A |  |  |  |
        |__|__|__|
      B |  |  |  |
        |__|__|__|
      C |  |  |  |
        |__|__|__|
    GRID

    expect(stdout).to have_printed "Enter your move >"

    stdin.puts "R2"

    expect(stdout).to have_printed <<~ERROR

      Invalid coordinates 'R2'

    ERROR

    expect(stdout).to have_printed "Enter your move >"

    stdin.puts "D2"

    expect(stdout).to have_printed <<~ERROR

      Invalid coordinates 'D2'

    ERROR

    expect(stdout).to have_printed "Enter your move >"

    stdin.puts "B2"

    expect(stdout).to have_printed <<~GRID

         1  2  3
         __ __ __
      A |  |  |  |
        |__|__|__|
      B |  |X |  |
        |__|__|__|
      C |  |  |  |
        |__|__|__|

    GRID

    expect(stdout).to have_printed <<~CPU
      Thinking...

         1  2  3
         __ __ __
      A |  |  |  |
        |__|__|__|
      B |  |X |  |
        |__|__|__|
      C |O |  |  |
        |__|__|__|
    CPU

    expect(stdout).to have_printed "Enter your move >"

    stdin.puts "A1"

    expect(stdout).to have_printed <<~GRID

         1  2  3
         __ __ __
      A |X |  |  |
        |__|__|__|
      B |  |X |  |
        |__|__|__|
      C |O |  |  |
        |__|__|__|

    GRID

    expect(stdout).to have_printed <<~CPU
      Thinking...

         1  2  3
         __ __ __
      A |X |  |  |
        |__|__|__|
      B |  |X |O |
        |__|__|__|
      C |O |  |  |
        |__|__|__|
    CPU

    expect(stdout).to have_printed "Enter your move >"

    stdin.puts "C3"

    expect(stdout).to have_printed <<~GRID

         1  2  3
         __ __ __
      A |X |  |  |
        |__|__|__|
      B |  |X |O |
        |__|__|__|
      C |O |  |X |
        |__|__|__|

      Game Over - You won :)
    GRID
  end
end
