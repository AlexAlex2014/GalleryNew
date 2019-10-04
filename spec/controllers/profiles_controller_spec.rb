require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  # let(:valid_session) { {} }
  let(:user) { create(:user_bot) }
  let(:profile) { create(:profile) }

  # let(:valid_attributes) {
  #   {
  #       'location' => 'Kiev',
  #       'gender' =>  'm',
  #       'birthday' => '01.01.2000',
  #       'user_id' => user.id
  #   }
  # }

  before do
    I18n.locale = 'en'
    sign_in user
    @params = {
      id: profile.id,
      user_id: user.id
    }
    # byebug
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

    # context 'GET #edit' do
    #   it "assigns the requested profile as @profile" do
    #     profile = Profile.create! valid_attributes
    #     get :edit, params: {id: profile.to_param}, session: valid_session
    #     expect(assigns(:profile)).to eq(profile)
    #   end
    # end

  # context 'PUT #update' do
  #   it 'should update profile info' do
  #     params = {
  #       location: 'Kiev123',
  #       gender: 'f'
  #     }
  #     put :update, params: { id: profile.id, profile: params }
  #     profile.reload
  #     params.keys.each do |key|
  #       expect(profile.attributes[key.to_s]).to eq params[key]
  #     end
  #   end
  # end

  describe 'Profile controller request specs' do
    context 'GET #show' do
      # let!(:user) { create(:user_bot) }
      # let!(:profile) { create :profile }
      it 'should success and render to edit page' do
        # sign_in user
        # byebug
        get :show, params: @params
        expect(response).to have_http_status(200)
        expect(response).to render_template :show
      end
    end
  end






  # context 'POST #create' do
  #   it 'create a new like' do
  #     expect { post :create, params: { user_id: user.id, likable_id: image_bot.id, likable_type: 'Image' } }.to change { Like.count }.by(1)
  #   end
  # end
  #
  # context 'DELETE #destroy' do
  #   it 'should delete like' do
  #     expect { delete :destroy, params: @params }.to change(Like, :count).by(-1)
  #   end
  # end
end
