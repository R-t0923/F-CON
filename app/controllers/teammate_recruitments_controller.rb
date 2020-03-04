class TeammateRecruitmentsController < ApplicationController
  before_action :authenticate_end_user!,except: [:index, :show]
  # ユーザー本人しか下記のアクションを行えないようにする
  before_action :ensure_correct_user,{only: [:edit,:update,:destroy]}
  def index
    # 新しい順に上から表示（降順）,８投稿毎にページをかえる
    @teammate_recruitments = TeammateRecruitment.all.order(created_at: :desc).page(params[:page]).per(8) 
    # モデルに定義した絞り込み検索の記述を呼び出す
    if params[:name].present?
    @teammate_recruitments = @teammate_recruitments.get_by_name params[:name]
    end
    if params[:city].present?
    @teammate_recruitments = @teammate_recruitments.get_by_city params[:city]
    end
    if params[:category].present?
    @teammate_recruitments = @teammate_recruitments.get_by_category params[:category]
    end
    if params[:level].present?
    @teammate_recruitments = @teammate_recruitments.get_by_level params[:level]
    end
  end

  def new
    @teammate_recruitment = TeammateRecruitment.new
  end

  def create
    @teammate_recruitment = TeammateRecruitment.new(teammate_recruitment_params)
    @group = Group.find(params[:group_id])
    @teammate_recruitment.group_id = @group.id
    if @teammate_recruitment.save
      redirect_to teammate_recruitments_path, notice: "投稿に成功しました"
    else
      render :new
    end
  end

  def edit
    @teammate_recruitment = TeammateRecruitment.find(params[:id])
  end

  def update
    @teammate_recruitment = TeammateRecruitment.find(params[:id])
    if @teammate_recruitment.update(teammate_recruitment_params)
      redirect_to @teammate_recruitment ,notice: "投稿編集が完了しました"
    else
      render :edit
    end
  end
 
  def show
    @teammate_recruitment = TeammateRecruitment.find(params[:id])
    @comment = TeammateComment.new
    @comments = @teammate_recruitment.teammate_comments.order(created_at: :desc).page(params[:page]).per(5) 
  end

  def destroy
    teammate_recruitment = TeammateRecruitment.find(params[:id])
    teammate_recruitment.destroy
    redirect_to root_path
  end
  
  private
  def teammate_recruitment_params
    params.require(:teammate_recruitment).permit(:group_id, :schedule, :title, :money, :level, :on_recruit, :introduction)
  end

  def ensure_correct_user
    @group = Group.find_by(id: params[:group_id])
    if @group.end_user_id != current_end_user.id || current_end_user.admin == false
    redirect_to root_path
    end
  end
end
