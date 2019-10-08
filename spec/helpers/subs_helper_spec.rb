require 'rails_helper'

RSpec.describe SubsHelper, type: :helper do
  include LikesHelper

  it 'response success' do
    expect(response).to be_successful
  end
end
