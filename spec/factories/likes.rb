# frozen_string_literal: true

FactoryBot.define do
  factory :like, class: Like do
    association :user, factory: :user_bot
  end
end
