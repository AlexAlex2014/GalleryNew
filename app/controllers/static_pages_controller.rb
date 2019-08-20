class StaticPagesController < ApplicationController
  skip_before_action :require_login

  def home
    if user_signed_in?
      redirect_to newsfeed_path
    end

    @categories = Category.select("categories.*, (COUNT(images.id)+COUNT(comments.id)+COUNT(likes.id)) AS i")
                      .left_outer_joins(:images, images: [:comments, :likes]).group("categories.id")
                      .order("i DESC").limit(5)
    @category_images = {}
    @categories.each do |category|
      @category_images[category] = category.images.first if category.images.size > 0
    end

  end
end
