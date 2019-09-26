FactoryBot.define do
  factory :user do
    id { "1" }
    first_name { "Tyson" }
    last_name { "Mike" }
    email { "mike@gmail.com" }
    password { "blabla" }
  end

  factory :category do
    id { "1" }
    title { "Cars" }
    user_id { "1" }
  end


end
