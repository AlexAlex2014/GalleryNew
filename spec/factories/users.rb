FactoryBot.define do
  factory :user, class: User do
    # sequence(:id) { |i| i }
    first_name { "Tyson" }
    last_name { "Mike" }
    sequence(:email) { "mike@gmail.com" }
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

  factory :user_val, class: User do
    id { 20 }
    first_name { "Black" }
    last_name { "Jack" }
    email { "emailqqq@gmail.com" }
    password { "123456" }
  end

  # factory :user_sub, class: User do
  #   # id { 30 }
  #   first_name { "Black" }
  #   last_name { "Jack" }
  #   sequence(:email) { |i| "emailsub#{i}@gmail.com" }
  #   password { "123456" }
  # end
end
