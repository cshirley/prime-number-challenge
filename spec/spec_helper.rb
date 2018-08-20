require 'simplecov'
#SimpleCov.start
root_file_path = File.dirname(File.absolute_path(__FILE__))
Dir.glob(root_file_path + '/../lib/*') { |file| require file }

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end
end

RSpec::Matchers.define :be_a_valid_sized_matrix do |expected_row_count, expected_column_count|

  match do |actual|
    has_valid_row_count?(actual, expected_row_count) && each_row_has_valid_column_count?(actual, expected_column_count)
  end

  def has_valid_row_count?(actual, row_count)
    actual.count == row_count
  end

  def each_row_has_valid_column_count?(actual, column_count)
    actual.each { |row| return false if row.size != column_count }
    return true
  end
end

RSpec::Matchers.define :be_a_valid_multiplication_matrix do |x_values, y_values|
  match do |actual|
    actual.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        expect(cell).to eq(x_values[x] * y_values[y])
      end
    end
  end
end
