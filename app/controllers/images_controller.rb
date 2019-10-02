class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_image, only: [:show, :edit, :update]

  def index
    @images = Image.select("images.*, (COUNT(comments.id)+COUNT(likes.id)) AS i")
                  .left_outer_joins(:comments, :likes).group("images.id")
                  .order("i DESC").page(params[:page])
    render index_img
  end

  def index_img
  end

  def show
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    if @image.save
      redirect_to images_path
    else
      render :new
    end
  end

  def create_my_image
    @image = Image.new #(image_params)
    # raise dd
    @image.user_id = current_user.id
    if @image.save
      redirect_to profile_path(@image.user_id) #images_path
    else
      render :new
    end
  end

  def edit
  end

  def update
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
