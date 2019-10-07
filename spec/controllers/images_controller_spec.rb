require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  # login_user
  let(:user) { create(:user_bot) }
  # let(:category) { create(:category, user_id: user.id) }
  let(:image) { create(:image, user_id: user.id) }

  before do
    I18n.locale = 'en'
    user.confirm
    sign_in user
    @params = {
        # id: profile.id,
        # location: 'Kiev567',
        # gender: 'f'
    }
  end

  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/images').to route_to('images#index')
    end
    it 'routes to #create' do
      expect(post: '/images').to route_to('images#create')
    end
    it 'routes to #new' do
      expect(get: '/images/new').to route_to('images#new')
    end
    it 'routes to #edit' do
      expect(get: '/images/5/edit').to route_to('images#edit', id: '5')
    end
    it 'routes to #update' do
      expect(put: '/images/5').to route_to('images#update', id: '5')
    end
    it 'routes to #show' do
      expect(get: '/images/5').to route_to('images#show', id: '5')
    end
    it 'routes to #destroy' do
      expect(delete: '/images/5').to route_to('images#destroy', id: '5')
    end
    it 'routes to #create_my_image' do
      expect(post: 'create_my_image').to route_to('images#create_my_image')
    end


    it 'routes to #index' do
      expect(get: '/categories/1/images').to route_to('images#index', category_id: '1')
    end
    it 'routes to #create' do
      expect(post: '/categories/1/images').to route_to('images#create', category_id: '1')
    end
    it 'routes to #new' do
      expect(get: '/categories/1/images/new').to route_to('images#new', category_id: '1')
    end
    it 'routes to #edit' do
      expect(get: '/categories/1/images/5/edit').to route_to('images#edit', category_id: '1', id: '5')
    end
    it 'routes to #update' do
      expect(put: '/categories/1/images/5').to route_to('images#update', category_id: '1', id: '5')
    end
    it 'routes to #show' do
      expect(get: '/categories/1/images/5').to route_to('images#show', category_id: '1', id: '5')
    end
    it 'routes to #destroy' do
      expect(delete: '/categories/1/images/5').to route_to('images#destroy', category_id: '1', id: '5')
    end
  end

  context 'GET #show' do
    it 'response success' do
      assert_response :success
    end
  end

  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     # byebug
  #     expect(response).to have_http_status(:ok)
  #     # expect(response).to have_http_status(:success)
  #   end
  # end

  context 'GET #index' do
    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200 )
      expect(response).to render_template :index
    end
  end

  context 'GET #show' do
    it 'should success and render to show page' do
      get :show, params: { id: image.id }
      expect(response).to have_http_status(200 )
      expect(response).to render_template :show
    end
  end

  context 'POST #create' do
    it 'create a new image' do
      params = {
          image: '1.jpg',
          body: 'cars'
      }
      expect { post(:create, params: { image: params }) }.to change(Image, :count).by(1)
      # expect(flash[:notice]).to eq 'Product was successfully created.'
    end
  end




  # context 'GET #edit' do
  #   it "assigns the requested profile as @profile" do
  #     params = {
  #         location: 'Kiev567',
  #         gender: 'f'
  #     }
  #     get :edit, params: { id: user.id, profile: params }, session: valid_session
  #     expect(assigns(:profile)).to eq(profile)
  #   end
  # end

  # context 'PUT #update' do
  #   it 'should update profile info' do
  #     params = {
  #         location: 'Kiev123',
  #         gender: 'f'
  #     }
  #     put :update, params: { id: profile.id, profile: params }
  #     profile.reload
  #     params.keys.each do |key|
  #       expect(profile.attributes[key.to_s]).to eq params[key]
  #     end
  #   end
  # end
end
