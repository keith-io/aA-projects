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
     
  # associations

  # methods
end