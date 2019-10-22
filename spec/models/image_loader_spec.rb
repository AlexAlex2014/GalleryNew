# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImageLoader, type: :model do
  before(:all) do
    @image_loader1 = create(:image_loader)
  end

  context 'validation' do
    it 'is valid with valid attributes' do
      expect(@image_loader1).to be_valid
    end
  end
end
