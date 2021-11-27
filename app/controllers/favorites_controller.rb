class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def create
    @brand = Brand.find(params[:brand_id])
    favorite = current_user.favorites.new(brand_id: @brand.id)
    favorite.save
  end

  def destroy
    @brand = Brand.find(params[:brand_id])
    favorite = current_user.favorites.find_by(brand_id: @brand.id)
    favorite.destroy
  end
end
