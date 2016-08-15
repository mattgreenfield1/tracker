class WorkoutMap < ActiveRecord::Base
	belongs_to :workout_transaction
	belongs_to :workout_definition
end
