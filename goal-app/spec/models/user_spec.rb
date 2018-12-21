require 'rails_helper'
RSpec.describe User, type: :model do


# let!(:user) { create(:user) }

# subject(:user) do 
#   build(:user)
# end

describe 'validations' do
  before :each do
    create(:user)
  end

  it { should validate_presence_of :username } 
  it { should validate_presence_of :password_digest }
  it { should validate_presence_of :session_token }
  
  it { should validate_uniqueness_of :username }
  it { should validate_uniqueness_of :password_digest }
  it { should validate_uniqueness_of :session_token }
end
  
  describe 'associations' do
    it { should have_many :goals }
  end
  
  
  describe 'methods' do
    # before :each do
    let!(:user) { create(:user) }
    
    describe '::find_by_credentials' do
      context 'With valid credentials' do
        it 'Finds correct user' do
          expect(User.find_by_credentials(user.username , user.password)).to eq(user)
        end
      end
      context 'With invalid credentials' do
        it "Returns nil" do
          expect(User.find_by_credentials(user.username , "notstarwars")).to be_nil
          expect(User.find_by_credentials(user.password, user.username)).to be_nil
        end
      end
    end
    describe '#is_password?' do
      context 'With valid password' do
        it 'returns true' do
          expect(user.is_password?(user.password)).to be true
        end
      end

      context 'With invalid password' do
        it 'returns false' do
          expect(user.is_password?("ajrgoia")).to be false
        end
      end
    end
  end
end