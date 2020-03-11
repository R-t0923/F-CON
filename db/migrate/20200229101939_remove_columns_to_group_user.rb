class RemoveColumnsToGroupUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :group_users, :end_user_id, :integer
    remove_column :group_users, :group_id, :integer

  end
end
