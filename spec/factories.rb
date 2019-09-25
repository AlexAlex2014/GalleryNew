FactoryBot.define do
  factory :user do
    first_name { "Tyson" }
    last_name { "Mike" }
    email { "mike@gmail.com" }
    password { "blabla" }
  end
end
