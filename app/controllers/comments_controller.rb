class CommentsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def create
    @brand = Brand.find(params[:brand_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.brand_id = @brand.id
    @comment.save
  end

  def update
  end

  def destroy
    @brand = Brand.find(params[:brand_id])
    @comment = @brand.comments.find(params[:id])
    Comment.find_by(id: params[:id]).destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :rate)
  end
end
