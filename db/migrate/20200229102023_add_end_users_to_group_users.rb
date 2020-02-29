class AddEndUsersToGroupUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :group_users, :end_user, foreign_key: true
    add_reference :group_users, :group, foreign_key: true
  end
end
