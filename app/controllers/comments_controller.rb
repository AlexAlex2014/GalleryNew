class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = Comment.all
  end

  def create
    @image = Image.friendly.find(params[:image_id])
    @comment = @image.comments.create(comment_params)
    redirect_to request.referrer
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
end
