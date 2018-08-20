require 'spec_helper'

describe MatrixRender do

 let(:test_axis) { [1,2,3,4] }
 let(:test_matrix) { [test_axis,test_axis,test_axis,test_axis] }
 let(:matrix_title) { "test title" }

 describe "Prints matrix with a title" do
   before(:each) {
    @result = String.new
    view = MatrixRender.new({output:StringIO.new(@result,"w+"),
                        title:matrix_title,
                        vertical_header:test_axis,
                        horizontal_header:test_axis})

    view.render(test_matrix)
   }
   it { expect(@result).to include(matrix_title) }
   it { expect(@result.lines.count).to eq(7) }
 end

 describe "Prints matrix without a title" do
   before(:each) {
    @result = String.new
    view = MatrixRender.new({output:StringIO.new(@result,"w+"),
                        title:"",
                        vertical_header:test_axis,
                        horizontal_header:test_axis})

    view.render(test_matrix)
   }
   it { expect(@result).not_to include(matrix_title) }
   it { expect(@result.lines.count).to eq(6) }
 end

end
