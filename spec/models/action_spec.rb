# frozen_string_literal: true.
require 'rails_helper'

RSpec.describe Action, type: :model do
  before(:all) do
    @action1 = create(:action)
  end

  context 'validation' do
    it "is valid with valid attributes" do
      expect(@action1).to be_valid
    end

    it "is not valid without a user_id" do
      action2 = build(:action, user_id: nil)
      expect(action2).not_to be_valid
    end

    it "is valid without an action" do
      action2 = build(:action, action: nil)
      expect(action2).to be_valid
    end

    it "is valid without an action_path" do
      action2 = build(:action, action_path: nil)
      expect(action2).to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
  end
end
