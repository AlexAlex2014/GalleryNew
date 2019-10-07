require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  let(:user) { create(:user_bot) }
  let(:profile) { create(:profile, user_id: user.id) }
  # let(:current_user) { create(:user) }
  # let(:having_attributes) {  }
  # let(:valid_session) { {} }


  # before do
  #   I18n.locale = 'en'
  #   # sign_in current_user
  #   sign_in current_user
  #   # @params = {
  #   #   id: profile.id
  #   #   # user_id: user.id
  #   # }
  # end

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

  # describe 'GET #show' do
  #   it 'response with 200 ' do
  #     get :show
  #     expect(response.response_code).to eq(200)
  #   end
  #   it 'renders the index template' do
  #     get :show
  #     expect(response).to render_template('profiles/show')
  #   end
  # end

  # context 'GET #edit' do
  #   it "assigns the requested profile as @profile" do
  #     profile = Profile.create! having_attributes
  #     get :edit, params: {id: profile.to_param}, session: valid_session
  #     expect(assigns(:profile)).to eq(profile)
  #   end
  # end

  context 'PUT #update' do
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
  end

  # context 'POST #create' do
  #   it 'create a new like' do
  #     expect { post :create, params: { user_id: user.id, likable_id: image_bot.id, likable_type: 'Image' } }.to change { Like.count }.by(1)
  #   end
  # end
end
