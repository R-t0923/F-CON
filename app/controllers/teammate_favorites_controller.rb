class TeammateFavoritesController < ApplicationController
  def create
    teammate_recruitment =TeammateRecruitment.find(params[:teammate_recruitment_id])
    favorite = current_end_user.teammate_favorites.new(teammate_recruitment_id: teammate_recruitment.id)
    favorite.save
    redirect_back(fallback_location: root_path)
  end
  def destroy
    teammate_recruitment =TeammateRecruitment.find(params[:teammate_recruitment_id])
    favorite = current_end_user.teammate_favorites.find_by(teammate_recruitment_id: teammate_recruitment.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
