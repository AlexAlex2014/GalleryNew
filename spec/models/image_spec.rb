# frozen_string_literal: true.
require 'rails_helper'
require "models/concerns/likable_spec"

RSpec.describe Image, type: :model do
  it_behaves_like "likable"

  before(:all) do
    @image1 = create(:image)
    @image3 = create(:image_bot)

  end
  context 'validation' do
    it "is valid with valid attributes" do
      expect(@image1).to be_valid
    end

    it "is valid without a body" do
      image2 = build(:image, body: nil)
      expect(image2).to be_valid
    end

    it "is not valid without an category_id" do
      image2 = build(:image, category_id: nil)
      expect(image2).not_to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:likes) }
  end

  describe 'Add slug to image' do
    it 'add image_slug == to image.body' do
      slug = @image3.slug_was
      expect(slug).to eq("cars")
    end
  end
end
