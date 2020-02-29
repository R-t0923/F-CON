class TeammateCommentsController < ApplicationController
  def create
    teammate = Teammate.find(params[:teammate_id])
    # comment = TeammateComment.new(teammate_comment_params)
    # comment.user_id = current_user.id
    comment = current_end_user.teammate_comments.new(teammate_comment_params)
    comment.teammate_id = teammate.id
    comment.save
    redirect_to teammate_path(teammate)
  end

  def destroy
    comment = TeammateComment.find(params[:id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def teammate_comment_params
      params.require(:teammate_comment).permit(:end_user_id,:teammate_id,:comment)
  end
end
