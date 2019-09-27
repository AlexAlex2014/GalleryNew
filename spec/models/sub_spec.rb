require 'rails_helper'

RSpec.describe Sub, type: :model do
  before(:all) do
    @sub1 = create(:sub)
  end

  context 'validation' do
    it "is valid with valid attributes" do
      expect(@sub1).to be_valid
    end

    # it "has a unique email" do
    #   user2 = build(:user, email: "azuev3199@gmail.com")
    #   expect(user2).to_not be_valid
    # end
    #
    # it "has a unique first_name" do
    #   user2 = build(:user, email: "bob@gmail.com", first_name: "Mike")
    #   expect(user2).to be_valid
    # end
    #
    # it "is not valid without a password" do
    #   user2 = build(:user, password: nil)
    #   expect(user2).to_not be_valid
    # end
    #
    # it "is not valid without an email" do
    #   user2 = build(:user, email: nil)
    #   expect(user2).to_not be_valid
    # end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:subable) }
    it { is_expected.to belong_to(:user) }
  end
end
