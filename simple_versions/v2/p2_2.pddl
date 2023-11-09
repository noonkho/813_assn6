(define (problem workout_v2) (:domain gym_v2)
(:objects 
    squat jj - exercise
    short mid long - length
    john noon - person
)

(:init
    
    ; Facts
    (= (exe-length short) 5)
    (= (exe-length mid) 10)
    (= (exe-length long) 15)

    ; Restriction
    (= (max-exercise-count) 3)

    ; Initial counts for John
    (= (exe-count john squat) 0)
    (= (exe-duration john squat) 0)
    
    (= (exe-count john jj) 0)
    (= (exe-duration john jj) 0)

    (= (workout_duration john) 0)   

    (current-exercise john warmup)


    ; Initial counts for Noon
    (= (exe-count noon squat) 0)
    (= (exe-duration noon squat) 0)
    
    (= (exe-count noon jj) 0)
    (= (exe-duration noon jj) 0)

    (= (workout_duration noon) 0)   

    (current-exercise noon warmup)

    ; Required Predicates to switch between exercises
    (exercise-change warmup jj)
    (exercise-change warmup squat)
    (exercise-change jj jj)
    (exercise-change jj squat)
    (exercise-change squat jj)
    (exercise-change squat squat)

    (not-exercising john)
    (not-exercising noon)

)

(:goal (and
    (not-exercising john)
    (not-exercising noon)

    ; John workout duration in total
    (>= (workout_duration john) 50)
    ; John squat goal
    (>= (exe-duration john squat) 30)
    ; John jumping jack goal
    (= (exe-duration john jj) 20)

    ; Noon workout duration in total
    (>= (workout_duration noon) 60)
    ; Noon squat goal
    (>= (exe-duration noon squat) 10)
    ; Noon jumping jack goal
    (>= (exe-duration noon jj) 30)

))


)
