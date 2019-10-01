FactoryBot.define do
  factory :like, class: Like do
    association :user, factory: :user
  end
end