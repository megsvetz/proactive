class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :type
      t.text :exercise_description
      t.integer :sets
      t.integer :reps
      t.boolean :extra_weight
      t.integer :weight

      t.timestamps null: false
    end
  end
end
