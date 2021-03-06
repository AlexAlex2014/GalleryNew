# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/users').to route_to('registrations#create')
    end
    it 'routes to #new' do
      expect(get: '/users/sign_up').to route_to('registrations#new')
    end
    it 'routes to #edit' do
      expect(get: '/users/edit').to route_to('registrations#edit')
    end
    it 'routes to #update' do
      expect(put: '/users').to route_to('registrations#update')
    end
    it 'routes to #destroy' do
      expect(delete: '/users').to route_to('registrations#destroy')
    end
  end
end
