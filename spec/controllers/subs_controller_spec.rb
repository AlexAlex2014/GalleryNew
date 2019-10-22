# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubsController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:sub) { create(:sub, subable: category) }

  before do
    I18n.locale = 'en'
    sign_in user
    @params = {
      id: sub.id
    }
  end

  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/subs').to route_to('subs#create')
    end
    it 'routes to #destroy' do
      expect(delete: '/subs/10').to route_to('subs#destroy', id: '10')
    end
  end

  context 'POST #create' do
    it 'create a new sub' do
      expect {
        post :create, params: { user_id: user.id,
                                subable_id: category.id,
                                subable_type: 'Category' }
      }.to change { Sub.count }.by(1)
    end
  end

  context 'DELETE #destroy' do
    it 'should delete sub' do
      expect { delete :destroy, params: @params }.to change(Sub, :count).by(-1)
    end
  end
end
