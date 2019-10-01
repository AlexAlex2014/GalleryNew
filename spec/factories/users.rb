FactoryBot.define do
  factory :user, class: User do
    # sequence(:id) { |i| i }
    first_name { "Tyson" }
    last_name { "Mike" }
    sequence(:email) { |i| "mike#{i}@gmail.com" }
    # email { "azuev3199@gmail.com" }
    password { "blabla" }
  end

  factory :user_bot, class: User do
    # sequence(:id) { |i| i }
    first_name { "Black" }
    last_name { "Jack" }
    sequence(:email) { |i| "email#{i}@gmail.com" }
    password { "123456" }
  end
end
