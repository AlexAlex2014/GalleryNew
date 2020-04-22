# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:categories) { 4.times.map { build(:category) } }
  let(:user) { create(:user_bot) }
  let(:category) { create(:category, user_id: user.id) }
  let(:valid_session) { {} }

  before do
    I18n.locale = 'en'
    user.confirm
    sign_in user
    @params = {
      id: category.id
    }
  end

  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/categories').to route_to('categories#index')
    end
    it 'routes to #create' do
      expect(post: '/categories').to route_to('categories#create')
    end
    it 'routes to #new' do
      expect(get: '/categories/new').to route_to('categories#new')
    end
    it 'routes to #edit' do
      expect(get: '/categories/5/edit').to route_to('categories#edit', id: '5')
    end
    it 'routes to #update' do
      expect(put: '/categories/5').to route_to('categories#update', id: '5')
    end
    it 'routes to #show' do
      expect(get: '/categories/5').to route_to('categories#show', id: '5')
    end
    it 'routes to #destroy' do
      expect(delete: '/categories/5').to route_to('categories#destroy', id: '5')
    end

    it 'routes to #create_my_category' do
      expect(post: 'create_my_category')
        .to route_to('categories#create_my_category')
    end
  end

  context 'GET #index' do
    it 'shows all categories' do
      params = { categories: categories }
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
      get :show, params: @params
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'assigns a new category as @category' do
      get :new, params: {}, session: valid_session
      expect(assigns(:category)).to be_a_new(Category)
    end
    it 'should success and render to new page' do
      get :new, params: @params
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
    end
  end

  context 'POST #create' do
    it "redirects to the category's page after the category is created" do
      post :create, params: { category: { title: 'Car' } }
      @category = assigns(:category)
      expect(response).to redirect_to(@category)
    end
    it "renders 'new' template if valiadtions fail" do
      post :create, params: { category: { title: nil } }
      expect(response).to render_template('new')
    end
    it 'create a new category' do
      params = {
        title: 'bussiness'
      }
      expect { post(:create, params: { category: params }) }
        .to change(Category, :count).by(1)
    end
  end

  context 'POST #create_my_category' do
    it 'create_my_category a new category' do
      params = {
        title: 'bussiness'
      }
      expect { post(:create_my_category, params: { category: params }) }
        .to change(Category, :count).by(1)
    end
  end

  context 'GET #edit' do
    it 'should success and render to show page' do
      get :edit, params: @params
      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end
    it 'should success and render to edit page' do
      get :edit, params: @params
      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end
  end

  context 'PUT #update' do
    it "redirects to category's page if validations pass" do
      put :update, params: { id: category.id, category: { title: 'GreateCar' } }
      expect(response).to redirect_to(category)
    end
    it 'renders #edit form if validations fail' do
      put :update, params: { id: category.id, category: { title: '' } }
      expect(response).to render_template('edit')
    end
    it 'should update category info' do
      params = {
        title: 'bussiness'
      }
      put :update, params: { id: category.id, category: params }
      category.reload
      params.keys.each do |key|
        expect(category.attributes[key.to_s]).to eq params[key]
      end
    end
    it 'redirects to certain category' do
      expect(response.status).to eq(200)
    end
    it 'updates the category' do
      category.reload
      expect(category).to having_attributes(title: 'cars')
    end
  end

  context 'DELETE #destroy' do
    it 'should delete category' do
      expect { delete :destroy, params: @params }
        .to change(Category, :count).by(-1)
    end
  end
end
