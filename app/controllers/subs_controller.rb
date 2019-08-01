class SubsController < ApplicationController
  def create
    @sub = Sub.create(user_id: params[:user_id], subable_id: params[:subable_id],
                        subable_type: params[:subable_type])
    if @sub.save
    else
      flash[:warning] = "Something went wrong"
    end
    redirect_to request.referrer
  end

  def destroy
    @sub = Sub.find_by(id: params[:id])
    @sub.destroy
    if @sub.save
    else
      flash[:warning] = "Something went wrong"
    end
    redirect_to request.referrer
  end

  # def newsfeed
  #   @categories = Category.all
  #   @category = Category.new
  #   @user = current_user
  #   @subs = @user.subs
  #   @category_subs = {}
  #   @categories.each do |category|
  #     @category_subs[category] = category.subs.first if category.subs.size > 0
  #   end
  #   # @categories = @sub.categories #get_newsfeed.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  # end
end
