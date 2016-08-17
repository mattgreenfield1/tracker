class HomeController < ApplicationController
	def index
		@workout_defs = WorkoutDefinition.all.group_by{|d| d.type}
	end
end
