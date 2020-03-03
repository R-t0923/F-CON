class GroupUsersController < ApplicationController
  def index
    @join_groups = GroupUser.where(end_user_id: current_end_user.id).order(created_at: :desc).page(params[:page]).per(8) 
  end
  def create
    group =Group.find(params[:group_id])
    join = current_end_user.group_users.new(group_id: group.id)
    join.save
    redirect_back(fallback_location: root_path)
  end
  def destroy
    group =Group.find(params[:group_id])
    quit = current_end_user.group_users.find_by(group_id: group.id)
    quit.destroy
    redirect_back(fallback_location: root_path)
  end
end
