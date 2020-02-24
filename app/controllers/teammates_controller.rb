class TeammatesController < ApplicationController
  def index
  end

  def new
    @teammate = Teammate.new
    
  end

  def create
    @teammate = Teammate.new(teammate_params)
    @group = Group.find(params[:group_id])
    @teammate.group_id = @group.id
    if @teammate.save
      redirect_to group_teammates_path, notice: "投稿に成功しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end
 
  def show
  end

  def destroy
  end
  
  private
  def teammate_params
    params.require(:teammate).permit(:group_id, :schedule, :title, :money, :level, :on_recruit, :introduction)
  end
end
