class MatchmakeCommentsController < ApplicationController
  def create
    matchmake = Matchmake.find(params[:matchmake_id])
    # comment = MatchmakeComment.new(matchmake_comment_params)
    # comment.user_id = current_user.id
    comment = current_end_user.matchmake_comments.new(matchmake_comment_params)
    comment.matchmake_id = matchmake.id
    comment.save
    redirect_to matchmake_path(matchmake)
  end

  def destroy
    comment = MatchmakeComment.find(params[:id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def matchmake_comment_params
      params.require(:matchmake_comment).permit(:end_user_id,:matchmake_id,:comment)
  end
end
