require_relative "lib/game"

$stdout.sync = true

if ENV.key?("SEED")
  srand ENV["SEED"].to_i
end

Game.new(input: $stdin, output: $stdout).play
