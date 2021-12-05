class BrandsController < ApplicationController
   before_action :authenticate_user!,except: [:index]
  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    @brand.user_id = current_user.id
    if @brand.save
    redirect_to brands_path
    else
    render 'new'
    end
  end


  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    redirect_to brands_path
  end

  def index
    @brands = Brand.all.page(params[:page]).per(9)
  end

  def show
    @brand = Brand.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(params[:id])
    if @brand.comments.blank?
      @average_rate = 0
    else
      @average_rate = @brand.comments.average(:rate)
    end
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    @brand.user_id = current_user.id
    if @brand.update(brand_params)
      redirect_to brands_path
    else
      render "edit"
    end
  end

  private
  def brand_params
    params.require(:brand).permit(:user_id, :prefecture_id, :brand_name, :jan , :body, :brand_image)
  end

end
