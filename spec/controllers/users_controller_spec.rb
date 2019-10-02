require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # let(:user) { create(:user) }
  # let(:category) {create(:category)}
  # let(:subs) { 4.times.map { create(:sub) } }
  #
  # before do
  #   I18n.locale = 'en'
  #   sign_in user
  #   @params = { id: user.id, email: user.email, first_name: user.first_name, last_name: user.last_name }
  # end

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

  # describe "newsfeed action" do
  #   it "renders newsfeed template if an user is found" do
  #     # category = create(:category)
  #     # @categories = Category.all
  #     # @user = create(:user)
  #     # sub = create(:sub, subable: category)
  #     # @subs = Sub.all
  #     # @subs = @user.subs
  #     # @categories = Category.all
  #     @params = { id: user.id}
  #     get :newsfeed, params: @params
  #     expect(response).to render_template('newsfeed')
  #     # response.should render_template('show')
  #   end
  #
  #
  #   it 'renders the template' do
  #     @params = { id: user.id}
  #     get :newsfeed, params: @params
  #     expect(response).to render_template('newsfeed')
  #   end
  #   it 'response success' do
  #     @params = { id: user.id}
  #     get :newsfeed, params: @params
  #     expect(response).to be_successful
  #   end
  # end

  # describe 'GET #edit' do
  #   before do
  #     get :edit, params: @params
  #   end
  #   it 'renders the template' do
  #     expect(response).to render_template('edit')
  #   end
  #   it 'response success' do
  #     expect(response).to be_successful
  #   end
  #   it 'saves and assigns user to @user' do
  #     expect(assigns(:user)).to eq user
  #   end
  # end

  # describe 'create action' do
  #   it 'redirects to image croppping page if validations pass' do
  #     post :create, item: { name: 'Item 1', price: '10' }
  #     expect(response).to redirect_to(..._path(assigns(:item)))
  #   end
  # end
end
