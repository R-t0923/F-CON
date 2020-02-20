class CreateMatchmakeFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :matchmake_favorites do |t|
      t.integer :user_id, null: false
      t.integer :matchmake_id, null: false
      
      t.timestamps
    end
  end
end
