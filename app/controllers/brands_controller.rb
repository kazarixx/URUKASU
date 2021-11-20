class BrandsController < ApplicationController
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
  end

  def index
    @brands = Brand.all.page(params[:page]).per(10)
  end

  def show
    @brand = Brand.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
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
