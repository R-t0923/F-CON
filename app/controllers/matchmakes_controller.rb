class MatchmakesController < ApplicationController
  before_action :authenticate_end_user!,except: [:index, :show]
  # ユーザー本人とAdminしか下記のアクションを行えないようにする
  before_action :ensure_correct_user,{only: [:edit,:update,:destroy]}
  def index
    # 新しい順に上から表示（降順）,８投稿毎にページをかえる
    @matchmakes = Matchmake.all.order(created_at: :desc).page(params[:page]).per(8) 
    # モデルに定義した絞り込み検索の記述を呼び出す
    if params[:name].present?
    @matchmakes = @matchmakes.get_by_name params[:name]
    end
    if params[:category].present?
    @matchmakes = @matchmakes.get_by_category params[:category]
    end
    if params[:level].present?
    @matchmakes = @matchmakes.get_by_level params[:level]
    end
    if params[:day].present?
      @matchmakes = @matchmakes.get_by_day params[:day]
      end
  end

  def new
    @matchmake = Matchmake.new
  end

  def create
    @matchmake = Matchmake.new(matchmake_params)
    @group = Group.find(params[:group_id])
    @matchmake.group_id = @group.id
    if @matchmake.save
      redirect_to matchmakes_path, notice: "投稿に成功しました"
    else
      render :new
    end
  end

  def edit
    @matchmake = Matchmake.find(params[:id])
  end

  def update
    @matchmake = Matchmake.find(params[:id])
    if @matchmake.update(matchmake_params)
      redirect_to @matchmake ,notice: "投稿編集が完了しました"
    else
      render :edit
    end
  end

  def show
    @matchmake = Matchmake.find(params[:id])
    @comment = MatchmakeComment.new
    @comments = @matchmake.matchmake_comments.order(created_at: :desc).page(params[:page]).per(5) 
  end

  def destroy
    @matchmake = Matchmake.find(params[:id])
    @matchmake.destroy
    redirect_to group_path(@matchmake.group_id)
  end
  
  private
  def matchmake_params
    params.require(:matchmake).permit(:group_id, :title, :money, :day, :time, :place, :introduction, :category, :capacity, :level, :on_recruit)
  end

  def ensure_correct_user
    @group = Group.find_by(id: params[:group_id])
    if @group.end_user_id != current_end_user.id && current_end_user.admin == false
      redirect_to root_path
    end
  end
end