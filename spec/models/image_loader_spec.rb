# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImageLoader, type: :model do
  before(:all) do
    @image_loader1 = create(:image_loader)
  end

  describe 'columns' do
    %i[
      id site_path created_at updated_at
    ].each do |field|
      it { is_expected.to have_db_column(field) }
    end
  end

  context 'validation' do
    it 'is valid with valid attributes' do
      expect(@image_loader1).to be_valid
    end
  end
end
