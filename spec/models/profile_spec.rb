# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile, type: :model do
  before(:all) do
    @profile1 = create(:profile)
  end

  describe 'columns' do
    %i[
      id location gender birthday created_at updated_at user_id
    ].each do |field|
      it { is_expected.to have_db_column(field) }
    end
    %i[
      user_id
    ].each do |field|
      it { is_expected.to have_db_index(field) }
    end
  end

  context 'validation' do
    it 'is valid with valid attributes' do
      expect(@profile1).to be_valid
    end

    it 'is not valid without a user_id' do
      profile2 = build(:profile, user_id: nil)
      expect(profile2).not_to be_valid
    end

    it 'is valid without a location' do
      profile2 = build(:profile, location: nil)
      expect(profile2).to be_valid
    end

    it 'is valid without a gender' do
      profile2 = build(:profile, gender: nil)
      expect(profile2).to be_valid
    end

    it 'is valid without a birthday' do
      profile2 = build(:profile, birthday: nil)
      expect(profile2).to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
  end
end
