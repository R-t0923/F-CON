class MatchmakeCommentsController < ApplicationController
  before_action :authenticate_end_user!
  def create
    @matchmake = Matchmake.find(params[:matchmake_id])
    @comment = current_end_user.matchmake_comments.new(matchmake_comment_params)
    @comment.matchmake_id = @matchmake.id
    @comment.save
    @comments = MatchmakeComment.where(matchmake_id:params[:matchmake_id]).order(created_at: :desc).page(params[:page]).per(8)
  end

  def destroy
    @comment = MatchmakeComment.find(params[:id])
    @comment.destroy
    @comments = MatchmakeComment.where(matchmake_id:params[:matchmake_id]).order(created_at: :desc).page(params[:page]).per(8)
  end

  private
  def matchmake_comment_params
      params.require(:matchmake_comment).permit(:end_user_id,:matchmake_id,:comment)
  end
end
