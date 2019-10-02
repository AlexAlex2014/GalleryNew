require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let (:user) { create(:user) }
  let(:category) {create(:category)}
  let(:subs) { 4.times.map { create(:sub) } }

  before do
    I18n.locale = 'ru'
    sign_in user
    @params = { id: user.id, email: user.email, first_name: user.first_name, last_name: user.last_name }
  end

  describe "newsfeed action" do
    # it "renders newsfeed template if an user is found" do
    #   # category = create(:category)
    #   # @categories = Category.all
    #   # @user = create(:user)
    #   # sub = create(:sub, subable: category)
    #   # @subs = Sub.all
    #   # @subs = @user.subs
    #   # @categories = Category.all
    #   @params = { id: user.id}
    #   get :newsfeed, params: @params
    #   expect(response).to render_template('newsfeed')
    #   # response.should render_template('show')
    # end


    it 'renders the template' do
      @params = { id: user.id}
      get :newsfeed, params: @params
      expect(response).to render_template('newsfeed')
    end
    it 'response success' do
      @params = { id: user.id}
      get :newsfeed, params: @params
      expect(response).to be_successful
    end
  end
end
