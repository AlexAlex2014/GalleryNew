require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:user) { create(:user_bot) }
  let(:image_bot) { create(:image_bot) }
  let(:like) { create(:like, likable: image_bot) }

  before do
    I18n.locale = 'en'
    sign_in user
    @params = {
        id: like.id
    }
  end

  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/likes').to route_to('likes#create')
    end
    it 'routes to #destroy' do
      expect(delete: '/likes/20').to route_to('likes#destroy', id: '20')
    end
  end

  context 'POST #create' do
    it 'create a new like' do
      expect { post :create, params: { user_id: user.id, likable_id: image_bot.id, likable_type: 'Image' } }.to change { Like.count }.by(1)
    end
  end

  context 'DELETE #destroy' do
    it 'should delete like' do
      expect { delete :destroy, params: @params }.to change(Like, :count).by(-1)
    end
  end
end
