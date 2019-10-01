# frozen_string_literal: true.
require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user1 = create(:user)
  end
  context 'validation' do
    it "is valid with valid attributes" do
      expect(@user1).to be_valid
    end

    it "has a unique email" do
      user2 = build(:user, email: "mike1@gmail.com")
      expect(user2).not_to be_valid
    end

    it "has a non-unique first_name" do
      user2 = build(:user, email: "bob@gmail.com", first_name: "White")
      expect(user2).to be_valid
    end

    it "has a non-unique last_name" do
      user2 = build(:user, email: "bob@gmail.com", last_name: "Bob")
      expect(user2).to be_valid
    end

    it "is not valid without a password" do
      user2 = build(:user, password: nil)
      expect(user2).not_to be_valid
    end

    it "is not valid without an email" do
      user2 = build(:user, email: nil)
      expect(user2).not_to be_valid
    end

    # it "raises exception if user has no confirm" do
    #   expect( -> { create(:user) } ).to raise_exception
    # end
  end

  describe 'Associations' do
    it { is_expected.to have_one(:profile) }
    it { is_expected.to have_many(:categories) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:likes) }
    it { is_expected.to have_many(:subs) }
    it { is_expected.to have_many(:images) }
    it { is_expected.to have_many(:actions) }
  end

  describe '#full_name' do
    it 'has a full_name' do
      expect(@user1.full_name).to eq "Tyson" + " " + "Mike"
    end
    it 'is valid without first_name' do
      expect(build(:user, first_name: nil)).to be_valid
    end
    it 'is valid without last_name' do
      expect(build(:user, last_name: nil)).to be_valid
    end
    it 'is valid without first_name & last_name' do
      expect(build(:user, first_name: nil, last_name: nil)).to be_valid
    end
  end

  describe '.logins_before_captcha' do
    it 'has a logins_before_captcha' do
      expect(User.logins_before_captcha).to eq 2
    end
  end
end

