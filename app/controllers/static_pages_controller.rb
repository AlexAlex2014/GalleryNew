# frozen_string_literal: true

# class StaticPagesController
class StaticPagesController < ApplicationController
  skip_before_action :require_login

  def home
    redirect_to newsfeed_path if user_signed_in?
  end

  def image_urls
    category_sort_arr
    @category_images = {}
    @category_sort_arr.each do |category|
      if category.images.size.positive?
        @category_images[category] = category.images.first
      end
    end
    @category_images
  end
end
