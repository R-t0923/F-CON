class GroupUsersController < ApplicationController
  def index
    # 参加チーム一覧
    @join_groups = GroupUser.where(end_user_id: current_end_user.id).order(created_at: :desc).page(params[:page]).per(8) 
    # チーム作成一覧
    @create_groups = Group.where(end_user_id: current_end_user.id).order(created_at: :desc).page(params[:page]).per(8) 
  end
  def create
    @group =Group.find(params[:group_id])
    join = current_end_user.group_users.build(group_id: @group.id)
    join.save
  end
  def destroy
    @group =Group.find(params[:group_id])
    quit = current_end_user.group_users.find_by(group_id: @group.id)
    quit.destroy
  end
end
