WorkoutDefinition.delete_all

muscle_groups = ['abs', 'back', 'biceps', 'calves', 'chest', 'triceps', 'legs (squats)', 'deadlifts']
muscle_groups.each do |mg|
	WorkoutDefinition.create(name: mg, type: 'WeightliftingDefinition')
	puts "Created weightlifting definition #{mg}"
end

cardio = ['sprinting', 'jogging', 'jump rope']
cardio.each do |c|
	WorkoutDefinition.create(name: c, type: 'CardioDefinition')
	puts "Created cardio definition #{c}"
end

mma = ['boxing', 'jiu jitsu']
boxing = WorkoutDefinition.create(name: 'boxing', type: 'MmaDefinition')
jiujitsu = WorkoutDefinition.create(name: 'jiujitsu', type: 'MmaDefinition')