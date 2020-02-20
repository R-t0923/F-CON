class CreateTeammates < ActiveRecord::Migration[5.2]
  def change
    create_table :teammates do |t|
      t.integer :group_id, null: false
      t.text :schedule, null: false
      t.string :title, null: false
      t.string :money, null: false
      t.integer :level, null: false
      t.boolean :on_recruit, null: false, default: true
      t.text :introduction, null: false

      t.timestamps
    end
  end
end
