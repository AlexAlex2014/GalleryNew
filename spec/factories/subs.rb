FactoryBot.define do
  factory :sub do
    sequence(:id) { |i| i }
    association(:user)
  end
end