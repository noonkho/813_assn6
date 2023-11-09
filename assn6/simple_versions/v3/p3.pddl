(define (problem workout_v3) (:domain gym_v3)
(:objects 
    squat jj sp bp - exercise
    short mid long - length
    john - person
    rack - equipment
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
    (current-exercise john warmup)

    (exercise-change warmup jj)
    (exercise-change jj jj)
    (exercise-change jj squat)
    (exercise-change squat squat)

    (not-exercising)
    
    not(using rack)
    (requires bp rack)
    (requires sp rack)




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
