class TeammateFavoritesController < ApplicationController
  before_action :authenticate_end_user!
  def index
    # メンバー募集のお気に入り一覧
    @teammate_favorites = TeammateFavorite.where(end_user_id: current_end_user.id).order(created_at: :desc).page(params[:page]).per(8)
    # マッチメイクのお気に入り一覧
    @matchmake_favorites = MatchmakeFavorite.where(end_user_id: current_end_user.id).order(created_at: :desc).page(params[:page]).per(8)
  end
  def create
    @teammate_recruitment =TeammateRecruitment.find(params[:teammate_recruitment_id])
    favorite = current_end_user.teammate_favorites.build(teammate_recruitment_id: @teammate_recruitment.id)
    favorite.save
  end
  def destroy
    @teammate_recruitment =TeammateRecruitment.find(params[:teammate_recruitment_id])
    favorite = current_end_user.teammate_favorites.find_by(teammate_recruitment_id: @teammate_recruitment.id)
    favorite.destroy
  end
end


