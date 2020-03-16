class Coordinates
  attr_reader :value

  def initialize(value:)
    @value = value
  end

  def valid?
    valid_values.include?(value)
  end

  def to_s
    value
  end

  private

  def valid_values
    %w[A1 A2 A3 B1 B2 B3 C1 C2 C3]
  end
end
