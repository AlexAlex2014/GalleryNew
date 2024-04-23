# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  let(:user) { create(:user_bot) }
  let(:category) { create(:category, user_id: user.id) }
  let(:image) { create(:image, user_id: user.id, category_id: category.id) }
  let(:sub) { create(:sub, subable: category, user_id: user.id) }
  let(:mail) { UserMailer.welcome_email(user) }
  let(:sub_email) { UserMailer.sub_email(sub) }
  let(:image_email) { UserMailer.image_email(@arr) }

  before do
    @arr = []
    @arr << user.email
    @arr << image
    @arr << image.category
  end

  describe 'notify' do
    it 'renders the headers' do
      expect(mail.subject).to eq('Welcome to App gallery')
      expect(mail.to).to eq([user.email.to_s])
      expect(mail.from).to eq([Rails.application.credentials.username_mail])
    end

    it 'renders the headers' do
      expect(sub_email.subject).to eq('You subscribed to the category')
      expect(sub_email.to).to eq([user.email.to_s])
      expect(sub_email.from).to eq([Rails.application.credentials.username_mail])
    end

    it 'renders the headers' do
      expect(image_email.subject).to eq('New image added')
      expect(image_email.to).to eq([@arr[0]])
      expect(image_email.from).to eq([Rails.application.credentials.username_mail])
    end
  end
end
