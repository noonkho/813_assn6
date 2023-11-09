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

    ; Initial counts for John
    (= (exe-count john squat) 0)
    (= (exe-duration john squat) 0)
    
    (= (exe-count john jj) 0)
    (= (exe-duration john jj) 0)

    (= (workout_duration john) 0)   

    ; Required Predicates to switch between exercises
    (exercise-change john warmup jj)
    (exercise-change john jj jj)
    (exercise-change john jj squat)
    ; (exercise-change john squat jj)
    (exercise-change john squat squat)

    (current-exercise john warmup)

    (not-exercising)

)

(:goal (and
    ;todo: put the goal condition here
    (not-exercising)

    ; John working out
    ; John workout duration in total
    (>= (workout_duration john) 60)
    ; John squat goal
    (= (exe-count john squat) 3)
    (>= (exe-duration john squat) 30)
    ; John jumping jack goal
    (= (exe-count john jj) 3)
    (>= (exe-duration john jj) 20)

))


)
