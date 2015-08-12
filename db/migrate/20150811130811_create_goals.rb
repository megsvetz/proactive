class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :goal
      t.string :diet_goal

      t.boolean :completed, default: false
      t.date :completed_date

      t.boolean :exercised, default: false
      t.integer :streak

      t.timestamps null: false
    end
  end
end
