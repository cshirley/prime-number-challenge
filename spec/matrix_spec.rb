require 'spec_helper'

describe Matrix do
  it "should create an empty matrix" do
    result = Matrix.new.generate_multiplication_matrix
    expect(result).to eq([])
  end

  describe "Creates a 10 x 10 matrix" do
    before {
      axis = (1..10).to_a
      @result = Matrix.new({x:axis, y:axis}).generate_multiplication_matrix
    }
    it { expect(@result).to be_a_valid_sized_matrix(10,10) }
  end

  describe "Creates a 10 x 10 matrix with each cell holding the product of the axis" do
    let(:x_values) { (1..10).to_a }
    let(:y_values) { (1..10).to_a }

    before {
      @result = Matrix.new({x:x_values, y:y_values}).generate_multiplication_matrix
    }

    it { expect(@result).to be_a_valid_sized_matrix(x_values.count, y_values.count) }
    it { expect(@result).to be_a_valid_multiplication_matrix(x_values, y_values) }
  end
end


