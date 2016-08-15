class WorkoutTransaction < ActiveRecord::Base
	has_many :workout_maps
	has_many :workout_definitions, through: :workout_maps
end
