# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    image do
      Rack::Test::UploadedFile.new(Rails.root.join('spec/support/5.jpg'),
                                   'image/jpeg')
    end
    body { 'About Image' }
    association :category, factory: :category
  end

  factory :image_bot, class: Image do
    image do
      Rack::Test::UploadedFile.new(Rails.root.join('spec/support/5.jpg'),
                                   'image/jpeg')
    end
    body { 'cars' }
    association :category, factory: :category
  end
end
