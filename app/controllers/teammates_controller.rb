class TeammatesController < ApplicationController
  def index
    @teammates = Teammate.all
    @teammate_page = Teammate.page(params[:page]).per(8) 
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
    @teammate
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
end
