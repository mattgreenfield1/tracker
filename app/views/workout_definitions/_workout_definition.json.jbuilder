json.extract! workout_definition, :id, :name, :type, :created_at, :updated_at
json.url workout_definition_url(workout_definition, format: :json)