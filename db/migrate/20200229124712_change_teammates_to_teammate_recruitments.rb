class ChangeTeammatesToTeammateRecruitments < ActiveRecord::Migration[5.2]
  def change
    rename_table :teammates, :teammate_recruitments
  end
end
