require 'rails_helper'

RSpec.describe LikesHelper, type: :helper do
  include LikesHelper
  let(:user) { create(:user_bot) }
  let(:image_bot) { create(:image_bot) }
  let(:like) { create(:like, likable: image_bot) }

  before do
    def current_user
      user
    end
  end

  it 'returns five' do
    likable_id = image_bot.id
    likable_type = "Image1"

    expect(find_user_like(likable_id, likable_type)).to eq(find_user_like)
  end

  it 'response success' do
    # find_user_like(likable_id, likable_type)
    expect(response).to be_successful
  end
end
