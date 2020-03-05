class UsersController < ApplicationController
  before_action :authenticate_end_user!,except: [:index, :show]
  # ユーザー本人とAdminしか下記のアクションを行えないようにする
  before_action :ensure_correct_user,{only: [:edit,:update,:destroy]}
  def index
    # 新しい順に上から表示（降順）８人毎にページをかえる
    @users = EndUser.all.order(created_at: :desc).page(params[:page]).per(8)
    # モデルに定義した絞り込み検索の記述を呼び出す
    if params[:nick_name].present?
    @users = @users.get_by_nick_name params[:nick_name]
    end
    if params[:age].present?
    @users = @users.get_by_age params[:age]
    end
  end

  def show
    @user = EndUser.find(params[:id])
  end

  def edit
    @user = EndUser.find(params[:id])
  end

  def update
    @user = EndUser.find(params[:id])
    if @user.update(end_user_params)
    redirect_to user_path(@user.id), notice: "編集が完了しました"
    else
      render :edit
    end
  end

  def destroy
    user = EndUser.find(params[:id])
    user.destroy
    # グループ作成者が退会した場合は、グループに紐づくデータ（グループ参加者や投稿を全て削除
    group = Group.where(end_user_id: user.id)
    group.destroy_all
    redirect_to root_path
  end

  private
  def end_user_params
    params.require(:end_user).permit(:nick_name, :phone_number, :gender, :age, :fotsal_experience, :soccer_experience, :introduction, :user_image, :email, :deleted_at)
  end

  def ensure_correct_user
    @user = EndUser.find_by(id: params[:id])
    if @user.id != current_end_user.id || current_end_user.admin == false
      redirect_to root_path
    end
  end
end
