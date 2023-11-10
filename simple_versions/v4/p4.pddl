(define (problem workout_v1) (:domain gym_v1)
(:objects 
    squat jj sp bp curls- exercise
    short mid long - length
    john - person
    a_space rack dumbell - equipment
)

(:init
    
    ; Facts
    ; (equal no_equip no_equip)
    ; Time
    (= (exe-length short) 5)
    (= (exe-length mid) 10)
    (= (exe-length long) 15)

    ; Exercise
    (exercise-need squat a_space)
    (exercise-need jj a_space)
    (exercise-need sp rack)
    (exercise-need bp rack)
    (exercise-need curls dumbell)

    ; Restriction
    (= (max-exercise-count) 3)

    ; John's initial counts
    (= (exe-count john squat) 0)
    (= (exe-duration john squat) 0)
    
    (= (exe-count john jj) 0)
    (= (exe-duration john jj) 0)

    (= (exe-count john bp) 0)
    (= (exe-duration john bp) 0)

    (= (exe-count john sp) 0)
    (= (exe-duration john sp) 0)

    (= (exe-count john curls) 0)
    (= (exe-duration john curls) 0)

    (= (workout_duration john) 0)   

    ; John's initial status
    (current-exercise john warmup)
    

    ; Required Predicates to switch between exercises
    (exercise-change warmup squat)
    (exercise-change warmup jj)
    (exercise-change warmup sp)
    (exercise-change warmup bp)
    (exercise-change warmup curls)
    (exercise-change squat squat)
    (exercise-change squat jj)
    (exercise-change squat sp)
    (exercise-change squat bp)
    (exercise-change squat curls)
    (exercise-change jj squat)
    (exercise-change jj jj)
    (exercise-change jj sp)
    (exercise-change jj bp)
    (exercise-change jj curls)
    (exercise-change sp squat)
    (exercise-change sp jj)
    (exercise-change sp sp)
    (exercise-change sp bp)
    (exercise-change sp curls)
    (exercise-change bp squat)
    (exercise-change bp jj)
    (exercise-change bp sp)
    (exercise-change bp bp)
    (exercise-change curls curls)
    (exercise-change curls squat)
    (exercise-change curls jj)
    (exercise-change curls sp)
    (exercise-change curls bp)
    (location-change not_gym a_space)
    (location-change not_gym rack)
    (location-change not_gym dumbell)
    (location-change a_space a_space)
    (location-change a_space rack)
    (location-change a_space dumbell)
    (location-change rack a_space)
    (location-change rack rack)
    (location-change rack dumbell)
    (location-change dumbell a_space)
    (location-change dumbell rack)
    (location-change dumbell dumbell)


    (not-exercising)
    
    (not-using a_space)
    (not-using rack)
    (not-using dumbell)

    (at john not_gym)

)

(:goal (and
    ;todo: put the goal condition here
    (not-exercising)

    ; John workout duration in total
    (>= (workout_duration john) 90)
    ; John squat goal
    (>= (exe-duration john squat) 30)
    ; John jumping jack goal
    (= (exe-duration john jj) 20)
    (= (exe-duration john curl) 20)

    ; John rack's goal
    ; (= (exe-duration john bp) 10) ; if uncomment then it will stuck forever
    ; (>= (exe-duration john sp) 10) ; if uncomment then it will stuck forever

))


)
