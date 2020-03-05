class MatchmakeFavoritesController < ApplicationController
  before_action :authenticate_end_user!
  def create
    matchmake =Matchmake.find(params[:matchmake_id])
    favorite = current_end_user.matchmake_favorites.new(matchmake_id: matchmake.id)
    favorite.save
    redirect_back(fallback_location: root_path)
  end
  def destroy
    matchmake =Matchmake.find(params[:matchmake_id])
    favorite = current_end_user.matchmake_favorites.find_by(matchmake_id: matchmake.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
