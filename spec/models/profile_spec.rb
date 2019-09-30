require 'rails_helper'

RSpec.describe Profile, type: :model do
  before(:all) do
    @profile1 = create(:profile)
  end

  context 'validation' do
    it "is valid with valid attributes" do
      expect(@profile1).to be_valid
    end

    it "has a unique user_id" do
      profile2 = build(:profile, user_id: 2)
      expect(profile2).not_to be_valid
    end

    it "is not valid without a user_id" do
      profile2 = build(:profile, user_id: nil)
      expect(profile2).not_to be_valid
    end

    it "is valid without a location" do
      profile2 = build(:profile, location: nil)
      expect(profile2).to be_valid
    end

    it "is valid without a gender" do
      profile2 = build(:profile, gender: nil)
      expect(profile2).to be_valid
    end

    it "is valid without a birthday" do
      profile2 = build(:profile, birthday: nil)
      expect(profile2).to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
  end
end
