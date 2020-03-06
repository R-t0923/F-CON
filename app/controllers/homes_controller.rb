class HomesController < ApplicationController
  def top
    @matchmakes = Matchmake.all.order(created_at: :desc)
    @teammate_recruitments = TeammateRecruitment.all.order(created_at: :desc)
  end

  def about
  end
end
