FactoryBot.define do
  factory :sub, class: Sub do
    # sequence(:id) { |i| i }
    association :user, factory: :user
  end
end