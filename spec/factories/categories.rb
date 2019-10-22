# frozen_string_literal: true

FactoryBot.define do
  factory :category, class: Category do
    title { 'cars' }
    association :user, factory: :user_bot
  end
end
