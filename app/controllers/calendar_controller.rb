class CalendarController < ApplicationController
	def index
		@txns = WorkoutTransaction.all
		@classes = WorkoutClass.all
		
	end
end
