# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImageEmailJob, type: :job do
  include ActiveJob::TestHelper
  let(:user) { create(:user_bot) }
  let(:category) { create(:category, user_id: user.id) }
  let(:image) { create(:image, user_id: user.id, category_id: category.id) }

  it 'availability job methods' do
    arr = []
    arr << user.email
    arr << image
    arr << category
    ActiveJob::Base.queue_adapter = :test
    ImageEmailJob.perform(arr)
  end
end
