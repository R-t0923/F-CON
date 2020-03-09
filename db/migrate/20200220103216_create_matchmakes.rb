class CreateMatchmakes < ActiveRecord::Migration[5.2]
  def change
    create_table :matchmakes do |t|
      t.string :group_id, null: false
      t.string :title, null: false
      t.date :day, null: false
      t.time :time, null: false
      t.string :money, null: false
      t.text :place, null: false
      t.integer :category, null: false
      t.integer :capacity, null: false
      t.integer :level, null: false
      t.text :introduction, null: false

      t.timestamps
    end
  end
end
