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
end
