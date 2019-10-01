FactoryBot.define do
  factory :comment do
    sequence(:commenter) { |i| "Commenter#{i}" }
    sequence(:body) { |n| "About commment#{n}" }
    association :image, factory: :image
    association :user, factory: :user
  end

  factory :comment_bot, class: Comment do
    commenter { "commenter_1" }
    sequence(:body) { |n| "About commment#{n}" }
    association :image, factory: :image
    association :user, factory: :user
  end
end
