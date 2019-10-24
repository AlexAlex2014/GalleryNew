# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  let(:user) { create(:user_bot) }
  let(:profile) { create(:profile, user_id: user.id) }
  let(:valid_session) { {} }

  before do
    I18n.locale = 'en'
    user.confirm
    sign_in user
    @params = {
      id: profile.id,
      location: 'Kiev567',
      gender: 'f'
    }
  end

  describe 'routing' do
    it 'routes to #edit' do
      expect(get: '/profiles/5/edit').to route_to('profiles#edit', id: '5')
    end
    it 'routes to #update' do
      expect(put: '/profiles/5').to route_to('profiles#update', id: '5')
    end
    it 'routes to #show' do
      expect(get: '/profiles/5').to route_to('profiles#show', id: '5')
    end
    it 'routes to #destroy' do
      expect(delete: '/profiles/5').to route_to('profiles#destroy', id: '5')
    end
  end

  context 'GET #show' do
    it 'should success and render to edit page' do
      get :show, params: { id: profile.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

  context 'GET #edit' do
    it 'assigns the requested profile as @profile' do
      params = {
        location: 'Kiev567',
        gender: 'f'
      }
      get :edit, params: { id: user.id, profile: params },
                 session: valid_session
      expect(assigns(:profile)).to eq(profile)
    end
    it 'should success and render to edit page' do
      get :edit, params: { id: user.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end
  end

  context 'PUT #update' do
    it "redirects to profile's page if validations pass" do
      params = {
          location: 'Kiev123',
          gender: 'f'
      }
      put :update, params: { id: profile.id, profile: params }
      expect(response).to redirect_to(newsfeed_path)
    end
    it 'should update profile info' do
      params = {
        location: 'Kiev123',
        gender: 'f'
      }
      put :update, params: { id: profile.id, profile: params }
      profile.reload
      params.keys.each do |key|
        expect(profile.attributes[key.to_s]).to eq params[key]
      end
    end
    it 'redirects to certain profile' do
      expect(response.status).to eq(200)
    end
    it 'updates the profile' do
      profile.reload
      expect(profile).to having_attributes(location: 'Kiev')
    end
  end
end
