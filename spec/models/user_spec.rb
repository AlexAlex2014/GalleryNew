require 'rails_helper'
# require './app/models/user'

RSpec.describe User, type: :model do
  before(:all) do
    @user1 = create(:user)
  end
  context 'validation' do
    it "is valid with valid attributes" do
      expect(@user1).to be_valid
    end

    it "has a unique email" do
      user2 = build(:user, email: "azuev3199@gmail.com")
      expect(user2).to_not be_valid
    end

    it "has a unique first_name" do
      user2 = build(:user, email: "bob@gmail.com", first_name: "Mike")
      expect(user2).to be_valid
    end

    it "is not valid without a password" do
      user2 = build(:user, password: nil)
      expect(user2).to_not be_valid
    end

    it "is not valid without an email" do
      user2 = build(:user, email: nil)
      expect(user2).to_not be_valid
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
    it 'is invalid without first_name' do
      expect(build(:user, first_name: nil)).not_to be_valid
    end
    it 'is invalid without last_name' do
      expect(build(:user, last_name: nil)).not_to be_valid
    end
    it 'is invalid without first_name & last_name' do
      expect(build(:user, first_name: nil, last_name: nil)).not_to be_valid
    end
  end

  describe '.logins_before_captcha' do
    it 'has a logins_before_captcha' do
      expect(User.logins_before_captcha).to eq 2
    end
  end

  describe '#send_welcome_email' do
    xit 'has a send_welcome_email' do
    end
  end
end






#
# require 'rails_helper'
#
# RSpec.describe Book, type: :model do
#   context 'validation' do
#     it 'is invalid without title' do
#       expect(build(:book, title: nil)).not_to be_valid
#     end
#
#     it 'is invalid without description' do
#       expect(build(:book, description: nil)).not_to be_valid
#     end
#
#     it 'is invalid without price' do
#       expect(build(:book, price: nil)).not_to be_valid
#     end
#
#     it 'is invalid without year' do
#       expect(build(:book, year: nil)).not_to be_valid
#     end
#
#     it 'is invalid without quantity' do
#       expect(build(:book, quantity: nil)).not_to be_valid
#     end
#
#     it 'is invalid with incorrect price' do
#       expect(build(:book, price: 0)).not_to be_valid
#       expect(build(:book, price: -1)).not_to be_valid
#       expect(build(:book, price: 100_001)).not_to be_valid
#       expect(build(:book, price: 'price')).not_to be_valid
#     end
#
#     it 'is valid with correct price' do
#       expect(build(:book, price: 23)).to be_valid
#     end
#
#     it 'is invalid with incorrect quantity' do
#       expect(build(:book, quantity: 1.5)).not_to be_valid
#       expect(build(:book, quantity: -1)).not_to be_valid
#       expect(build(:book, quantity: 'quantity')).not_to be_valid
#     end
#
#     it 'is valid with correct quantity' do
#       expect(build(:book, quantity: 0)).to be_valid
#       expect(build(:book, quantity: 23)).to be_valid
#     end
#   end
#
#   context 'associations' do
#     let(:book) { create :book }
#
#     it 'has many authors' do
#       expect(book).to respond_to :authors
#     end
#
#     it 'has many images' do
#       expect(book).to respond_to :images
#     end
#
#     it 'has many categories' do
#       expect(book).to respond_to :categories
#     end
#   end
# end
#
#
#
#
# require 'rails_helper'
#
# RSpec.describe Category, type: :model do
#   context 'validation' do
#     it 'is invalid without name' do
#       expect(build(:category, name: nil)).not_to be_valid
#     end
#   end
#
#   context 'associations' do
#     it 'has many books' do
#       category = create :category
#       expect(category).to respond_to :books
#     end
#   end
# end