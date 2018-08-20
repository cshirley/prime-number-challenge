class Matrix
  DEFAULTS = {x:[], y:[]}
  attr_accessor :x_values, :y_values

  def initialize(options = {})
    options = DEFAULTS.merge(options)
    self.x_values = options[:x]
    self.y_values = options[:y]
  end

  def generate_multiplication_matrix
    x_values.inject([]) { |arr, x| arr << generate_multiplication_row(x) }
  end

private
  def generate_multiplication_row(x_value)
    y_values.inject([]) { |arr, y| arr << (x_value * y)}
  end

end
