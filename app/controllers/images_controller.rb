class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_image, only: [:show, :edit, :update]
  before_action :correct_user, :only => [:destroy]

  def index
    @images = Image.order('created_at DESC')
    render index_img
    # @category = Category.friendly.find(params[:category_id])
    # @category_images = @images.where(:category_id => @category.id)
  end

  def index_img

  end

  def show
  end

  def new
    @category_options = Category.all.map{|u| [ u.title, u.id ] }
    @image = Image.new
  end

  def create
    @category_options = Category.all.map{|u| [ u.title, u.id ] }
    @image = Image.new(image_params)
    if @image.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @category_options = Category.all.map{|u| [ u.title, u.id ] }
  end

  def update
    @category_options = Category.all.map{|u| [ u.title, u.id ] }

    if @image.update_attributes(image_params)
      redirect_to image_path(@image)
    else
      render :edit
    end
  end

  def destroy
    @image = Image.friendly.find(params[:id])
    @image.destroy

    redirect_to request.referrer
  end

  private

  def image_params
    params.require(:image).permit(:image, :body, :remove_image, :image_cache, :category_id, :remote_image_url)
  end

  def set_image
    @image = Image.friendly.find(params[:id])
  end
end
