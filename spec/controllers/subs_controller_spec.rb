require 'rails_helper'

RSpec.describe SubsController, type: :controller do
  before do
    # I18n.locale = 'en'
    # sign_in user
    # @params = { id: sub.id }
  end
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/subs').to route_to('subs#create')
    end
    it 'routes to #destroy' do
      expect(delete: '/subs/10').to route_to('subs#destroy', id: '10')
    end
  end

  context 'DELETE #destroy' do
    # let(:sub) { create(:sub) }
    let!(:category) { create(:category) }
    let!(:sub) { create(:sub, subable: category) }
    # @sub = Sub.find(params[:id])

    it 'should delete sub' do
      # byebug
      expect { delete :destroy, params: { id: sub.id } }.to change(Sub, :count).by(-1)
      expect(flash[:warning]).to eq 'Something went wrong'
      # byebug
    end
  end
end
