class AddIsImportedToWorkoutTransactions < ActiveRecord::Migration
  def change
  	add_column :workout_transactions, :is_imported, :boolean
  end
end
