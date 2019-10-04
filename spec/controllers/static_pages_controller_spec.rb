require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  let(:user) { create(:user_bot) }

  before do
    I18n.locale = 'en'
  end

  describe 'routing' do
    it 'routes to #create' do
      expect(get: '/').to route_to('static_pages#home')
    end
  end

  describe "GET #home" do
    it 'response with 200 ' do
      get :home
      expect(response.response_code).to eq(200)
    end
    it 'renders the index template' do
      get :home
      expect(response).to render_template('static_pages/home')
    end

    context 'response with redirect and success' do
      before do
        sign_in user
      end

      it 'response with redirect' do
        get :home
        assert_response :redirect
      end
      it 'response with success' do
        sign_out user
        get :home
        expect(response).to be_successful
      end
    end
  end
end
