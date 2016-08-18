module WorkoutDefinitionsHelper


	def days_since workout_def
		most_recent = workout_def.workout_transactions.maximum(:date)
		if (most_recent.nil?)
			''
		else
			(DateTime.now.to_date - most_recent).to_i
		end
	end
end
