class UsersController < ApplicationController
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_end_user!
  # ユーザー本人しか下記のアクションを行えないようにする
  before_action :ensure_correct_user,{only: [:edit,:update,:destroy]}
  def index
    # 新しい順に上から表示（降順）
    @users = EndUser.all.order(created_at: :desc)
    # ８人毎にページをかえる
    @user_page = EndUser.page(params[:page]).per(8) 
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
    redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def destroy
    user = EndUser.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  private
  def end_user_params
    params.require(:end_user).permit(:nick_name, :phone_number, :gender, :age, :fotsal_experience, :soccer_experience, :introduction, :user_image, :email, :deleted_at)
  end

  def ensure_correct_user
    @user = EndUser.find_by(id: params[:id])
    if @user.id != current_end_user.id
    redirect_to root_path
    end
  end

end
