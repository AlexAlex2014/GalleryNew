# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:comments) { 4.times.map { build(:comment) } }
  let(:user) { create(:user_bot) }
  let(:category) { create(:category, user_id: user.id) }
  let(:image) { create(:image, user_id: user.id, category_id: category.id) }
  let(:comment) { create(:comment_bot, user_id: user.id, image_id: image.id) }
  let(:valid_session) { {} }

  before do
    I18n.locale = 'en'
    user.confirm
    sign_in user
    @params = {
      id: comment.id,
      image_id: image.id,
      user_id: user.id
    }
  end

  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/comments').to route_to('comments#index')
    end
    it 'routes to #create' do
      expect(post: '/comments').to route_to('comments#create')
    end
    it 'routes to #destroy' do
      expect(delete: '/comments/5').to route_to('comments#destroy', id: '5')
    end
  end

  context 'GET #index' do
    it 'shows all comments' do
      params = { comments: comments }
      get :index, params: params
    end
    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
  end

  context 'POST #create' do
    it 'create a new comment' do
      params = {
        commenter: 'commenter_2',
        body: 'bussiness'
      }
      expect {
        post(:create, params: { user_id: user.id,
                                image_id: image.id,
                                comment: params })
      }.to change(Comment, :count).by(1)
    end
  end

  context 'DELETE #destroy' do
    it 'should delete comment' do
      expect { delete :destroy, params: @params }
        .to change(Comment, :count).by(-1)
    end
  end
end
