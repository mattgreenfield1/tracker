class CreateWorkoutClasses < ActiveRecord::Migration
  def change
    create_table :workout_classes do |t|
      t.string :details
      t.references :workout_definition, index: true, foreign_key: true
      t.string :time
      t.integer :day

      t.timestamps null: false
    end
  end
end
