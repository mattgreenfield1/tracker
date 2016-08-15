class CreateWorkoutTransactions < ActiveRecord::Migration
  def change
    create_table :workout_transactions do |t|
      t.string :details
      t.date :date
      t.string :time

      t.timestamps null: false
    end
  end
end
