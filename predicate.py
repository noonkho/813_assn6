exercises = ['warmup', 'squat', 'jj', 'sp', 'bp']

for i in exercises:
    for j in exercises[1:]:
        print("(exercise-change " + i + " " + j + ")")