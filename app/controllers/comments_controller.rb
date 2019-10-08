class CommentsController < ApplicationController
  before_action :authenticate_user!
  after_action :comments, only: [:create]

  def index
    @comments = Comment.order('created_at DESC')
    @users = User.all
  end

  def create
    @image = Image.friendly.find(params[:image_id])
    @comment = @image.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Comment successful"
    else
      flash[:error] = "Something went wrong"
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @image = Image.friendly.find(params[:image_id])
    @comment = @image.comments.friendly.find(params[:id])
    @comment.destroy
    redirect_to image_path(@image)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def comments
    Action.new(:user_id=>current_user.id, :action=>'comments',
               :action_path=>request.original_url).save if user_signed_in?
  end
end
