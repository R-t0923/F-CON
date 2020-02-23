class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    #user_id=グループ作成者と定義
    @group.user_id = current_end_user.id
    if @group.save!
      redirect_to group_path(@group), notice: "チームを作成しました"
    else
      render new_group_path
    end
  end

  def edit
  end

  def update
  end

  def show
    @group = Group.find(params[:id])
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to root_path
  end

  private
  def group_params
    params.require(:group).permit(:name, :city, :place, :category, :male_member, :female_member, :average_age, :level, :introduction, :group_image, :user_id)
  end
end
