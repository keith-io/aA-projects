require 'rspec'
require 'exercises.rb'


# create subject as instance that takes a block, the block instantiates our class
# [1, 2, 1, 3, 3].uniq # => [1, 2, 3]
describe Array do #"exercises" #or Array
    subject(:test_array) { Array.new([1, 2, 1, 3, 3]) }

    describe "#my_uniq" do 
        it "removes duplicate elements" do
            expect(test_array.my_uniq).to eq([1, 2, 3])
        end

        it "should not call ruby's build in .uniq method" do
            expect(test_array).to_not receive(:uniq) 
            test_array.my_uniq
        end
        
        describe "#two_sum" do
            let(:test_array) { Array.new([-1, 0, 2, -2, 1]) }
            
            it "sums elements" do
                expect(test_array.two_sum).to eq([[0, 4], [2, 3]])
            end
        end
        
        describe "#my_transpose" do
            let(:test_array) { Array.new([
                                [0, 1, 2],
                                [3, 4, 5],
                                [6, 7, 8]
                            ])}

            it "should not call ruby's build in .transpose method" do
                expect(test_array).to_not receive(:transpose)
                test_array.my_transpose
            end

            it "should correctly transpose an array" do
                expect(test_array.my_transpose).to eq( [[0, 3, 6],
                                                        [1, 4, 7],
                                                        [2, 5, 8]]) 
            end
            
        end


        describe "#stock_picker" do 
            let(:prices) { Array.new([10, 5, 1, 7, 9]) }

            it "should pick the most profitable days" do
                expect(prices.stock_picker).to eq([2, 4])
            end 
        end
    end
end