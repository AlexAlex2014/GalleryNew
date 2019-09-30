require 'rails_helper'
require "models/concerns/subable_spec"

RSpec.describe Category, type: :model do
  it_behaves_like "subable"

end
