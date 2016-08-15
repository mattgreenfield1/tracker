class CreateWorkoutDefinitions < ActiveRecord::Migration
  def change
    create_table :workout_definitions do |t|
      t.string :name
      t.string :type

      t.timestamps null: false
    end
  end
end
