# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubEmailJob, type: :job do
  include ActiveJob::TestHelper
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:sub) { create(:sub, subable: category) }

  it 'availability job methods' do
    ActiveJob::Base.queue_adapter = :test
    SubEmailJob.perform(sub)
  end
end
