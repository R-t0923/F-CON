class CreateMatchmakeComments < ActiveRecord::Migration[5.2]
  def change
    create_table :matchmake_comments do |t|
      t.integer :end_user_id, null: false
      t.integer :matchmake_id, null: false
      t.text :comment, null: false
      
      t.timestamps
    end
  end
end
