FactoryBot.define do
  factory :category do
    sequence(:id) { |i| i }
    sequence(:title) { |n| "Cars#{n}" }
    association(:user)

    after(:create) do |category|
      create(:sub, subable: category)
    end

  end

end
