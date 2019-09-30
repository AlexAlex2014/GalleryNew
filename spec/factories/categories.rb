FactoryBot.define do
  # factory :category, class: Category do
  #   sequence(:id) { |i| i }
  #   sequence(:title) { |n| "Cars#{n}" }
  #   association :user, factory: :user
  #
  #   after(:create) do |category|
  #     create(:sub, subable: category)
  #   end
  # end

  factory :category_sub, class: Category do
    sequence(:id) { |i| i }
    sequence(:title) { |n| "Cars#{n}" }
  end
end
