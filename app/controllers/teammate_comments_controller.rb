class TeammateCommentsController < ApplicationController
  def create
    teammate_recruitment = TeammateRecruitment.find(params[:teammate_recruitment_id])
    # comment = TeammateComment.new(teammate_comment_params)
    # comment.user_id = current_user.id
    comment = current_end_user.teammate_comments.new(teammate_comment_params)
    comment.teammate_recruitment_id = teammate_recruitment.id
    comment.save
    redirect_to teammate_recruitment_path(teammate_recruitment)
  end

  def destroy
    comment = TeammateComment.find(params[:id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def teammate_comment_params
      params.require(:teammate_comment).permit(:end_user_id,:teammate_recruitment_id,:comment)
  end
end
