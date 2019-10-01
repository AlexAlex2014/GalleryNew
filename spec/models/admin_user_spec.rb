# frozen_string_literal: true.
require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  before(:all) do
    @admin_user1 = create(:admin_user)
  end
  context 'validation' do
    it "is valid with valid attributes" do
      expect(@admin_user1).to be_valid
    end

    it "has a unique email" do
      admin_user2 = build(:admin_user, email: "admin1@gmail.com")
      expect(admin_user2).not_to be_valid
    end

    it "is not valid without a password" do
      admin_user2 = build(:admin_user, password: nil)
      expect(admin_user2).not_to be_valid
    end

    it "is not valid without an email" do
      admin_user2 = build(:admin_user, email: nil)
      expect(admin_user2).not_to be_valid
    end
  end
end
