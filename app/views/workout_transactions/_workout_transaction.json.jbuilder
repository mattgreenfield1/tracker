json.extract! workout_transaction, :id, :details, :date, :time, :created_at, :updated_at
json.url workout_transaction_url(workout_transaction, format: :json)