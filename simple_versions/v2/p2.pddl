(define (problem workout_v2) (:domain gym_v2)
(:objects 
    short mid long - length
    john noon - person
    squat jj mc - exercise
)

(:init
    
    ; Facts
    (= (exe-length short) 5)
    (= (exe-length mid) 10)
    (= (exe-length long) 15)

    ; Initial counts for John
    (= (exe-count john squat) 0)
    (= (exe-duration john squat) 0)
    
    (= (exe-count john jj) 0)
    (= (exe-duration john jj) 0)

    (= (workout_duration john) 0) 

    ; Initial counts for Noon
    (= (exe-count noon squat) 0)
    (= (exe-duration noon squat) 0)
    
    (= (exe-count noon mc) 0)
    (= (exe-duration noon mc) 0)

    (= (workout_duration noon) 0) 

    ; John
    (current-exercise john warmup)

    ; Noon
    (current-exercise noon warmup)

    (exercise-change warmup jj)
    (exercise-change warmup squat)

    (exercise-change jj jj)
    (exercise-change jj squat)
    (exercise-change squat jj)
    (exercise-change squat squat)
    (exercise-change squat mc)
    (exercise-change mc mc)


    (not-exercising john)
    (not-exercising noon)


)

(:goal (and
    ;todo: put the goal condition here
    (not-exercising john)
    (not-exercising noon)

    ; John working out
    ; John workout duration in total
    (>= (workout_duration john) 60)
    ; John squat goal
    (= (exe-count john squat) 3)
    (>= (exe-duration john squat) 30)
    ; John jumping jack goal
    (= (exe-count john jj) 3)
    (>= (exe-duration john jj) 20)

    ; Noon working out
    ; Noon workout duration in total
    (>= (workout_duration noon) 80)
    ; Noon squat goal
    (= (exe-count noon squat) 5)
    (>= (exe-duration noon squat) 50)
    ; Noon Mountain climbing goal
    (= (exe-count noon mc) 3)
    (>= (exe-duration noon mc) 30)

))


)
