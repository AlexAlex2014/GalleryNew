require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user_bot) }

  before do
    I18n.locale = 'en'
    user.confirm
    sign_in user
    @params = { id: user.id, first_name: user.first_name }
  end

  describe 'routing' do
    it 'routes to #newsfeed' do
      expect(get: '/newsfeed').to route_to('users#newsfeed')
    end
    it 'routes to #notifications' do
      expect(get: '/notifications').to route_to('users#notifications')
    end
    it 'routes to #edit' do
      expect(get: '/users/10/edit').to route_to('users#edit', id: '10')
    end
  end

  describe "newsfeed action" do
    it "renders newsfeed template" do
      get :newsfeed, params: { id: user.id}
      expect(response).to have_http_status(200 )
      expect(response).to render_template :newsfeed
    end
  end

  describe 'GET #edit' do
    # it 'response success' do
    #   assert_response :success
    # end
    it 'response success' do
      expect(response).to be_successful
    end
  end
end
