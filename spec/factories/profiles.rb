# frozen_string_literal: true

FactoryBot.define do
  factory :profile, class: Profile do
    location { 'Kiev' }
    gender { 'm' }
    birthday { '01.01.2000' }
    association :user, factory: :user_bot
  end
end
