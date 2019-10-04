FactoryBot.define do
  factory :image do
    sequence(:body) { |n| "About Image#{n}" }
    association :category, factory: :category
  end

  factory :image_bot, class: Image do
    image { '1.jpg' }
    body { 'cars' }
    # association :user, factory: :user_bot
    association :category, factory: :category
  end
end
