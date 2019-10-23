# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    image = create(:image)
    @like1 = create(:like, likable: image)
  end

  describe 'columns' do
    %i[
      id created_at updated_at likable_type likable_id user_id
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
      expect(@like1).to be_valid
    end

    it 'has a unique user_id' do
      like2 = build(:like, user_id: 2)
      expect(like2).not_to be_valid
    end

    it 'is not valid without a user_id' do
      like2 = build(:like, user_id: nil)
      expect(like2).not_to be_valid
    end

    it 'is not valid without a subable_type' do
      like2 = build(:like, likable_type: nil)
      expect(like2).not_to be_valid
    end

    it 'is not valid without a subable_id' do
      like2 = build(:like, likable_id: nil)
      expect(like2).not_to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to have_db_column(:likable_id).of_type(:integer) }
    it { is_expected.to have_db_column(:likable_type).of_type(:string) }
    it { is_expected.to belong_to(:likable) }
    it { is_expected.to belong_to(:user) }
  end
end
