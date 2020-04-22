# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Sub, type: :model do
  before(:all) do
    category = create(:category)
    @sub1 = create(:sub, subable: category)
  end

  describe 'columns' do
    %i[
      id created_at updated_at subable_type subable_id user_id
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
      expect(@sub1).to be_valid
    end

    it 'has a unique user_id' do
      sub2 = build(:sub, user_id: 2)
      expect(sub2).not_to be_valid
    end

    it 'is not valid without a user_id' do
      sub2 = build(:sub, user_id: nil)
      expect(sub2).not_to be_valid
    end

    it 'is not valid without a subable_type' do
      sub2 = build(:sub, subable_type: nil)
      expect(sub2).not_to be_valid
    end

    it 'is not valid without a subable_id' do
      sub2 = build(:sub, subable_id: nil)
      expect(sub2).not_to be_valid
    end
  end

  describe 'Associations' do
    context 'belong_to' do
      %i[user subable].each do |association|
        it { is_expected.to belong_to(association) }
      end
    end

    context 'have_db_column' do
      %i[subable_id subable_type].each do |association|
        it { is_expected.to have_db_column(association) }
      end
    end
  end
end
