class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.integer :city, null: false
      t.text :place
      t.integer :category, null: false
      t.integer :male_member, null: false
      t.integer :female_member, null: false
      t.integer :average_age, null: false
      t.integer :level, null: false
      t.text :introduction, null: false
      t.string :group_image_id

      t.timestamps
    end
  end
end
