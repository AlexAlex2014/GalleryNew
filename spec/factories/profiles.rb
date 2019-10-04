FactoryBot.define do
  factory :profile, class: Profile do
    location { "Kiev" }
    gender { "m" }
    birthday { "01.01.2000" }
    association :user, factory: :user_bot
  end

  # factory :profile_bot, class: Profile do
  #   # sequence(:id) { |i| i }
  #   location { "Kiev" }
  #   gender { "m" }
  #   birthday { "01.01.2000" }
  #   association :user, factory: :user_bot
  # end
end