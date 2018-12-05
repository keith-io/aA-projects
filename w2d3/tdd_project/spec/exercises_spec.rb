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
    end
    end