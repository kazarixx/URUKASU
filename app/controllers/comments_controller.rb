class CommentsController < ApplicationController
  def index
  end
  
  def create
    brand = Brand.find(params[:brand_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.brand_id = brand.id
    comment.save
    redirect_to brand_path(brand)
  end
  
  def update
  end
  
  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to brand_path(params[:brand_id])
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
