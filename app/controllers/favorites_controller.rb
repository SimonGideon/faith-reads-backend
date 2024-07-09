class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    user = User.find(params[:user_id])
    favorites = user.favorites

    render json: favorites, each_serializer: FavoriteSerializer
  end

  def create
    favorite = Favorite.new(favorite_params)
    if favorite.save
      render json: {
        status: { code: 200, message: "Successfully created favorite." },
        data: FavoriteSerializer.new(favorite).serializable_hash[:data][:attributes],
      }, status: :ok
    else
      render json: favorite.errors, status: :unprocessable_entity
    end
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :book_id)
  end
end