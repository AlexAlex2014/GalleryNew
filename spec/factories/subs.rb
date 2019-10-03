FactoryBot.define do
  factory :sub, class: Sub do
    association :user, factory: :user_bot
  end
end
