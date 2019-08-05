class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_params, if: :devise_controller?

  before_action :require_login
  before_action :drop_down_list, :drop_down_list_sort



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :password, :password_confirmation, :current_password])
  end

  def drop_down_list
    @category_options = Category.all.map{|u| [ u.title, u.id ] }.sort{|a, b| a[0] <=> b[0]}
  end

  def drop_down_list_sort
    # com = Image.joins( :comments).group('images.id')
    # img = Image.joins( :likes).group('images.id')

    @category_sort_arr = Category.select("categories.*, (COUNT(images.id)+COUNT(comments.id)+COUNT(likes.id)) AS i")
                      .left_outer_joins(:images, images: [:comments, :likes]).group("categories.id")
                      .order("i DESC").limit(5)

    # img = Image.joins(:fans, :comments).group('images.id')
    # @top_categories = Category.joins(img).group('categories.id').order('count(images.id) + count(likes.id) + count(comments.id) DESC')

    #@category_sort_arr = []
    #
    # @category_sort = Category.joins(:images).group('categories.id').order('count(images.id) DESC').limit(5).size
    # # raise dd
    #
    # @category_sort.each do |i|
    #   @category_sort_arr << Category.find(i[0])
    # end
    @category_options_sort = @category_sort_arr.map{|u| [ u.title, u.id ] }
    # raise dd
  end

  private

  def require_login
    # unless user_signed_in?
    #   flash[:error] = "You must log in to use the site"
    #   redirect_to root_path
    # end
  end

  def authorize_correct_user
    unless current_user.id = params[:id]
      flash[:error] = "You are not authorized to access this page"
      redirect_to root_path
    end
  end
end
