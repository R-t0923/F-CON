class CreateGropUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :grop_users do |t|
      t.string :user_id, null: false
      t.string :group_id, null: false

      t.timestamps
    end
  end
end
