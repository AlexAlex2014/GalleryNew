# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @comment1 = create(:comment)
    @comment3 = create(:comment_bot)
  end

  describe 'columns' do
    %i[
      id commenter body image_id created_at updated_at slug user_id
    ].each do |field|
      it { is_expected.to have_db_column(field) }
    end
    %i[
      user_id image_id slug
    ].each do |field|
      it { is_expected.to have_db_index(field) }
    end
  end

  context 'validation' do
    it 'is valid with valid attributes' do
      expect(@comment1).to be_valid
    end

    it 'is not valid without an image_id' do
      comment2 = build(:comment, image_id: nil)
      expect(comment2).not_to be_valid
    end

    it 'is not valid without an commenter' do
      comment2 = build(:comment, commenter: nil)
      expect(comment2).not_to be_valid
    end

    it 'is not valid without an user_id' do
      comment2 = build(:comment, user_id: nil)
      expect(comment2).not_to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:image) }
  end

  describe 'Add slug to comment' do
    it 'add comment_slug == to comment.commenter' do
      slug = @comment3.slug_was
      expect(slug).to eq('commenter_1')
    end
  end
end
