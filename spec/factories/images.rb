FactoryBot.define do
  factory :image do
    sequence(:body) { |n| "About Image#{n}" }
    association :category, factory: :category
  end

  factory :image_bot, class: Image do
    body { "cars" }
    association :category, factory: :category
  end
end
