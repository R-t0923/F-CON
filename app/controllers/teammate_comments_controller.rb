class TeammateCommentsController < ApplicationController
  before_action :authenticate_end_user!
  def create
    @teammate_recruitment = TeammateRecruitment.find(params[:teammate_recruitment_id])
    @comment = current_end_user.teammate_comments.new(teammate_comment_params)
    @comment.teammate_recruitment_id = @teammate_recruitment.id
    @comment.save
    @comments = TeammateComment.where(teammate_recruitment_id:params[:teammate_recruitment_id]).order(created_at: :desc).page(params[:page]).per(8)
  end

  def destroy
    @comment = TeammateComment.find(params[:id])
    @comment.destroy
    @comments = TeammateComment.where(teammate_recruitment_id:params[:teammate_recruitment_id]).order(created_at: :desc).page(params[:page]).per(8)
  end

  private
  def teammate_comment_params
      params.require(:teammate_comment).permit(:end_user_id,:teammate_recruitment_id,:comment)
  end
end
