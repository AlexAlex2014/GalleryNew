# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  let(:images) { 4.times.map { build(:image) } }
  let(:user) { create(:user_bot) }
  let(:category) { create(:category, user_id: user.id) }
  let(:image) { create(:image, user_id: user.id, category_id: category.id) }
  let(:valid_session) { {} }

  before do
    I18n.locale = 'en'
    user.confirm
    sign_in user
    @params = {
      id: image.id
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
      expect(get: '/categories/1/images')
        .to route_to('images#index', category_id: '1')
    end
    it 'routes to #create' do
      expect(post: '/categories/1/images')
        .to route_to('images#create', category_id: '1')
    end
    it 'routes to #new' do
      expect(get: '/categories/1/images/new')
        .to route_to('images#new', category_id: '1')
    end
    it 'routes to #edit' do
      expect(get: '/categories/1/images/5/edit')
        .to route_to('images#edit', category_id: '1', id: '5')
    end
    it 'routes to #update' do
      expect(put: '/categories/1/images/5')
        .to route_to('images#update', category_id: '1', id: '5')
    end
    it 'routes to #show' do
      expect(get: '/categories/1/images/5')
        .to route_to('images#show', category_id: '1', id: '5')
    end
    it 'routes to #destroy' do
      expect(delete: '/categories/1/images/5')
        .to route_to('images#destroy', category_id: '1', id: '5')
    end
  end

  context 'GET #index' do
    it 'shows all images' do
      params = { images: images }
      get :index, params: params
    end
    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
  end

  context 'GET #show' do
    it 'should success and render to show page' do
      get :show, params: { id: image.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'assigns a new image as @image' do
      get :new, params: {}, session: valid_session
      expect(assigns(:image)).to be_a_new(Image)
    end
    it 'should success and render to new page' do
      get :new, params: { id: image.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
    end
  end

  context 'POST #create' do
    it "redirects to the image's page after the image is created" do
      params = {
        image: Rack::Test::UploadedFile.new(Rails.root
          .join('spec/support/5.jpg'), 'image/jpeg'),
        body: 'bussiness',
        category_id: category.id,
        user_id: user.id
      }
      post :create, params: { image: params }
      expect(response).to redirect_to(images_path)
    end
    it "renders 'new' template if valiadtions fail after trying to create a image" do
      params = {
        image: nil,
        body: 'bussiness',
        category_id: category.id,
        user_id: user.id
      }
      post :create, params: { image: params }
      expect(response).to render_template('new')
    end
    it 'create a new image' do
      params = {
        image: Rack::Test::UploadedFile.new(Rails.root
          .join('spec/support/5.jpg'), 'image/jpeg'),
        body: 'bussiness',
        category_id: category.id,
        user_id: user.id
      }
      expect { post(:create, params: { image: params }) }
        .to change(Image, :count).by(1)
    end
  end

  context 'GET #edit' do
    it 'should success and render to show page' do
      get :edit, params: { id: image.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end
  end

  context 'PUT #update' do
    it 'should update image info' do
      params = {
        body: 'nature'
      }
      put :update, params: { id: image.id, image: params }
      image.reload
      params.keys.each do |key|
        expect(image.attributes[key.to_s]).to eq params[key]
      end
    end
    it 'redirects to certain image' do
      expect(response.status).to eq(200)
    end
    it 'updates the image' do
      image.reload
      expect(image).to having_attributes(body: 'About Image')
    end
  end

  context 'DELETE #destroy' do
    it 'should delete image' do
      expect { delete :destroy, params: @params }
        .to change(Image, :count).by(-1)
    end
  end
end
