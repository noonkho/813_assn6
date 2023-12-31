(define (problem workout_v1) (:domain gym_v1)
(:objects 
    squat jj - exercise
    short mid long - length
    john - person
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

    ; Required Predicates to switch between exercises
    (exercise-change warmup jj)
    (exercise-change jj jj)
    (exercise-change jj squat)
    (exercise-change squat jj)
    (exercise-change squat squat)

    (not-exercising)

)

(:goal (and
    ;todo: put the goal condition here
    (not-exercising)

    ; John workout duration in total
    (>= (workout_duration john) 50)
    ; John squat goal
    (>= (exe-duration john squat) 30)
    ; John jumping jack goal
    (= (exe-duration john jj) 20)

))


)
