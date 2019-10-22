# frozen_string_literal: true

FactoryBot.define do
  factory :image_loader, class: ImageLoader do
    site_path { 'https://stocksnap.io/search/city' }
  end
end
