class CategoriesController < ApplicationController
  # before_filter :authenticate_user!, except => [:show, :index]
  before_action :authenticate_user!
  def index
    @categories = Category.all
    @category_images = {}
    @categories.each do |category|
      @category_images[category] = category.images.first if category.images.size > 0
    end
  end

  def show
    @category = Category.friendly.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.friendly.find(params[:id])
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def update
    @category = Category.friendly.find(params[:id])

    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.friendly.find(params[:id])
    @category.destroy
    flash[:success] = "Category deleted"

    redirect_to newsfeed_path
    # redirect_to categories_path

  end


  def create_my_category
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      flash[:success] = "Category successful"
    else
      flash[:error] = "Something went wrong"
    end
    redirect_to @category #:back
  end

  private
  def category_params
    params.require(:category).permit(:title, :text, :user_id)
  end

  def correct_user
    @category = current_user.categories.find_by(id: params[:id])
    redirect_to root_url if @category.nil?
  end
end
