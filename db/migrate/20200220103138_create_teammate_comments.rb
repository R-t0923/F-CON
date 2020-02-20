class CreateTeammateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :teammate_comments do |t|
      t.integer :user_id, null: false
      t.integer :teammate_id, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
