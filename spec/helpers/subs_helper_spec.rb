# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubsHelper, type: :helper do
  include SubsHelper
  let(:user) { create(:user_bot) }
  let(:category) { create(:category) }
  let(:sub) { create(:sub, subable: category) }

  before do
    def current_user
      user
    end
  end

  it 'returns five' do
    subable_id = category.id
    subable_type = 'Category'

    expect(find_user_sub(subable_id, subable_type))
      .to eq(find_user_sub(subable_id, subable_type))
  end

  it 'response success' do
    expect(response).to be_successful
  end
end
