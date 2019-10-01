FactoryBot.define do
  factory :action, class: Action do
    action { "navigation" }
    action_path { "http://localhost:3000/categories?locale=en" }
    association :user, factory: :user
  end
end
