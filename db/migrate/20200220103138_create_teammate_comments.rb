class CreateTeammateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :teammate_comments do |t|
      t.integer :end_user_id, null: false
      t.integer :teammate_recruitment_id, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
