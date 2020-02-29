class TeammatesController < ApplicationController
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_end_user!
  # ユーザー本人しか下記のアクションを行えないようにする
  before_action :ensure_correct_user,{only: [:edit,:update,:destroy]}
  def index
    # 新しい順に上から表示（降順）,８投稿毎にページをかえる
    @teammates = Teammate.all.order(created_at: :desc).page(params[:page]).per(8) 
  end

  def new
    @teammate = Teammate.new
  end

  def create
    @teammate = Teammate.new(teammate_params)
    @group = Group.find(params[:group_id])
    @teammate.group_id = @group.id
    if @teammate.save
      redirect_to teammates_path, notice: "投稿に成功しました"
    else
      render :new
    end
  end

  def edit
    @teammate = Teammate.find(params[:id])
  end

  def update
    @teammate = Teammate.find(params[:id])
    if @teammate.update(teammate_params)
      redirect_to @teammate ,notice: "チーム編集が完了しました"
    else
      render :edit
    end
  end
 
  def show
    @teammate = Teammate.find(params[:id])
    @teammate_comment = TeammateComment.new
    @teammate_comments = @teammate.teammate_comments.page(params[:page]).per(5) 
    # @teammate_comments = [1,2,3,4]
  end

  def destroy
    teammate = Teammate.find(params[:id])
    teammate.destroy
    redirect_to root_path
  end
  
  private
  def teammate_params
    params.require(:teammate).permit(:group_id, :schedule, :title, :money, :level, :on_recruit, :introduction)
  end

  def ensure_correct_user
    @group = Group.find_by(id: params[:group_id])
    if @group.end_user_id != current_end_user.id
    redirect_to root_path
    end
  end
end
