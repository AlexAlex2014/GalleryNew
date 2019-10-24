# frozen_string_literal: true

require 'rails_helper'
require 'models/concerns/subable_spec'

RSpec.describe Category, type: :model do
  it_behaves_like 'subable'
  let(:categories) { 7.times.map { build(:category) } }

  before(:all) do
    @category1 = create(:category)
  end

  describe 'columns' do
    %i[
      id title text created_at updated_at slug user_id
    ].each do |field|
      it { is_expected.to have_db_column(field) }
    end
    %i[
      user_id slug
    ].each do |field|
      it { is_expected.to have_db_index(field) }
    end
  end

  context 'validation' do
    it 'is valid with valid attributes' do
      expect(@category1).to be_valid
    end

    it 'is valid without a body' do
      category2 = build(:category, title: nil)
      expect(category2).to be_valid
    end

    it 'is valid without an user_id' do
      category2 = build(:category, user_id: nil)
      expect(category2).to be_valid
    end

    it 'destroys dependent' do
      @user2 = categories.first.user
      expect { @user2.destroy }.to change { categories.count }.by(0)
    end
  end

  describe 'Associations' do
    context 'have_many' do
      %i[images subs].each do |association|
        it { is_expected.to have_many(association) }
      end
    end
  end

  describe 'Add slug to category' do
    it 'add category slug == to category.title' do
      slug = @category1.slug_was
      expect(slug).to eq('cars')
    end
  end
end
