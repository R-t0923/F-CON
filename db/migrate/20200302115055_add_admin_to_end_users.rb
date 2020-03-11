class AddAdminToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :admin, :boolean, default: false
  end
end
