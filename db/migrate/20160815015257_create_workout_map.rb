class CreateWorkoutMap < ActiveRecord::Migration
  def change
    create_table :workout_maps do |t|
    	t.integer :workout_definition_id 
    	t.integer :workout_transaction_id
    end
  end
end
