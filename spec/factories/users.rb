# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    first_name { 'Tyson' }
    last_name { 'Mike' }
    sequence(:email) { 'mike@gmail.com' }
    password { 'blabla' }
  end

  factory :user_bot, class: User do
    first_name { 'Black' }
    last_name { 'Jack' }
    sequence(:email) { |i| "email#{i}@gmail.com" }
    password { '123456' }
    password_confirmation { '123456' }
    # confirmed_at Date.today
  end

  factory :user_val, class: User do
    id { 20 }
    first_name { 'Black' }
    last_name { 'Jack' }
    email { 'emailqqq@gmail.com' }
    password { '123456' }
  end
end
