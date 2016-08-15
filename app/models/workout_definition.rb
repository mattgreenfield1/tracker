class WorkoutDefinition < ActiveRecord::Base
	has_many :workout_maps
	has_many :workout_transactions, through: :workout_maps
end
