require 'rspec'
require 'towers_of_hanoi'

describe Towers do
    subject(:game) { Towers.new }

    describe '#initialize' do
        it 'should initialize an empty array of three arrays' do
            expect(game.towers.length).to eq(3)
        end
        
        it 'first tower should not be empty' do 
            expect(game.towers[0].empty?).to eq(false)
        end 

        it 'first tower should have discs in descending order eg: [3, 2 ,1]' do
            expect(game.towers[0]).to eq(game.towers.first.sort.reverse)
        end
    end

        #give mock to def won?
        # mock for failing case, and mock for passing case
    describe '#won?' do 
        let(:losing_towers) { double('Nice Cat', mood: 'nice') }
        let(:winning_towers) { double('Nice Cat', mood: 'nice') }

        it 'should return false if not win condition' do   
            allow(losing_towers).to receive(:won?)
            expect(losing_towers.won?).to eq(false)
            # losing_towers.won?
        end 

        it 'should return true if win condition' do 

        end 


    end 

end

# spec1 instance var towers should be an array of arrays

# spec 2 first tower should have [3, 2, 1]

# spec 3 #move will pop off a disc of the selected tower and place disk on new tower

# spec 3a #move should receive :pop

# spec 3b #move should take 2 arguments (from, to)

# spec 4 #valid_move?(from, to) from.last should be < to.last || to.last == empty

# spec 5 #won? game.towers[0].empty? && game.towers[1].empty? => || game.towers[0].empty? && game.towers[2].empty? => true 



# mock1 = [[1,2,3], [], []]  => #won? == false
# mock2 = [[], [3,2,1], []]  => #won? == true

# allow(mock2).to_receive (:won?)
#expect true

# allow(mock1).to_receive (:won?)
#expect false

