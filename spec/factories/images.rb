FactoryBot.define do
  factory :image do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/5.jpg'), 'image/jpeg') }
    body { 'About Image' }
    # sequence(:body) { |n| "About Image#{n}" }
    association :category, factory: :category
  end

  factory :image_bot, class: Image do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/5.jpg'), 'image/jpeg') }
    body { 'cars' }
    # association :user, factory: :user_bot
    association :category, factory: :category
  end
end
