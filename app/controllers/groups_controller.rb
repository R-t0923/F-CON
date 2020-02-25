class GroupsController < ApplicationController
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_end_user!
  # ユーザー本人しか下記のアクションを行えないようにする
  before_action :ensure_correct_user,{only: [:edit,:update,:destroy]}
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
    if @group.save
      redirect_to group_path(@group), notice: "チームを作成しました"
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to @group ,notice: "チーム編集が完了しました"
    else
      render :edit
    end
  end

  def show
  @current_group = Group.find(params[:id])
    #user_idとend_user.idを結合させている
  @group = Group.joins("inner join end_users on groups.user_id = end_users.id").select("groups.*,end_users.*").find(params[:id])    
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to root_path
  end

  private
  def group_params
    params.require(:group).permit(:name, :city, :place, :category, :male_member, :female_member, :average_age, :level, :group_introduction, :group_image, :user_id)
  end

  def ensure_correct_user
    @group = Group.find_by(id: params[:id])
    if @group.user_id != current_end_user.id
    redirect_to root_path
    end
  end

end