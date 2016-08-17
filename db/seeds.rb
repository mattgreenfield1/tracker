WorkoutDefinition.delete_all

muscle_groups = ['abs', 'back', 'biceps', 'calves', 'chest', 'triceps', 'legs', 'deadlifts']
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

WorkoutClass.delete_all
WorkoutClass.create(details: 'All Levels', time: '12:00', day: 1, workout_definition: boxing)
WorkoutClass.create(details: 'All Levels', time: '12:00', day: 3, workout_definition: boxing)
WorkoutClass.create(details: 'All Levels', time: '12:00', day: 5, workout_definition: boxing)
WorkoutClass.create(details: 'All Levels', time: '11:00', day: 6, workout_definition: boxing)
WorkoutClass.create(details: 'Beginner', time: '17:30', day: 1, workout_definition: boxing)
WorkoutClass.create(details: 'Beginner', time: '18:30', day: 3, workout_definition: boxing)
WorkoutClass.create(details: 'Beginner', time: '17:30', day: 5, workout_definition: boxing)
WorkoutClass.create(details: 'Intermediate', time: '18:30', day: 2, workout_definition: boxing)
WorkoutClass.create(details: 'Intermediate', time: '18:30', day: 4, workout_definition: boxing)
WorkoutClass.create(details: 'Sparring', time: '17:30', day: 4, workout_definition: boxing)

WorkoutClass.create(details: 'Wrestling', time: '16:00', day: 0, workout_definition: jiujitsu)
WorkoutClass.create(details: 'Beginner', time: '12:00', day: 1, workout_definition: jiujitsu)
WorkoutClass.create(details: 'Beginner', time: '12:00', day: 3, workout_definition: jiujitsu)
WorkoutClass.create(details: 'Beginner', time: '18:30', day: 1, workout_definition: jiujitsu)
WorkoutClass.create(details: 'Beginner', time: '18:30', day: 3, workout_definition: jiujitsu)
WorkoutClass.create(details: 'Beginner (No Gi)', time: '18:30', day: 5, workout_definition: jiujitsu)
