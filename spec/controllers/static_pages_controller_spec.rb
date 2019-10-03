require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'routing' do
    it 'routes to #create' do
      expect(get: '/').to route_to('static_pages#home')
    end
  end
end
