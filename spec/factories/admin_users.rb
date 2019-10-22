# frozen_string_literal: true

FactoryBot.define do
  factory :admin_user, class: AdminUser do
    email { 'admin1@gmail.com' }
    password { '123456' }
  end
end
