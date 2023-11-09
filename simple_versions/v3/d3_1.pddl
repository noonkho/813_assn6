;Header and description

(define (domain gym_v1)

;remove requirements that are not needed
(:requirements :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

(:types
    exercise
    length
    person
    equipment
)

(:constants 
    warmup - exercise
    not_gym - equipment
)

(:predicates
    (not-exercising)
    (current-exercise ?p - person ?e - exercise)

    (exercise-change ?e1 ?e2 - exercise)
    (idle)

    (exercise-need ?e - exercise ?eq - equipment)
    (at ?p - person ?eq - equipment)
    (not-using ?eq - equipment)
    (location-change ?eq1 ?eq2 - equipment)
    (equal ?eq1 ?eq2 - equipment)
    (moving)
)


(:functions

    (exe-length ?l - length)

    (exe-count ?p - person ?e - exercise)
    (exe-duration ?p - person ?e - exercise)
    
    (workout_duration ?p - person)
    
    (max-exercise-count)
    (max-length-count ?l - length)
)


(:durative-action do-exercise
    :parameters (?p - person ?eq - equipment ?e - exercise ?l - length)
    :duration (= ?duration (exe-length ?l))
    :condition (and
        (at start (not-exercising))
        (at start (< (exe-count ?p ?e) (max-exercise-count)))

        ; (at start (idle))

        (at start (exercise-need ?e ?eq))

        (over all (at ?p ?eq))

    )
    :effect (and
        (at start (not (not-exercising)))
        (at start (not (current-exercise ?p warmup)))
        (at start (current-exercise ?p ?e))

        (at end (and
            (not-exercising)
            (increase (exe-count ?p ?e) 1)
            (increase (exe-duration ?p ?e) (exe-length ?l))
            (increase (workout_duration ?p) (exe-length ?l))
            (not (current-exercise ?p ?e))
        ))
    )
)


; (:durative-action take_break ; you must take break in between exercises (or else you will die :p)
;         :parameters (?p - person ?from ?to - exercise)
;         :duration (= ?duration 1)
;         :condition (and
;             (at start (current-exercise ?p ?from))
;             (at start (exercise-change ?from ?to))

;             (at end (current-exercise ?p ?to))
;         ) 
;         :effect (and
;             (at start (idle))

;             (at end (not (idle)))
;         )
; )

(:durative-action using_equip
    :parameters (?p - person ?eq - equipment)
    :duration (= ?duration 31)
    :condition (and 
        (at start (not-using ?eq))
        (at start (moving))
    )
    :effect (and 
        (at start (and 
            (not (at ?p not_gym))
            (not (not-using ?eq))
            (at ?p ?eq)
        ))
        (at end (and 
            (not-using ?eq)
            (not (at ?p ?eq))
        ))
    )
)

(:durative-action move
    :parameters (?p - person ?from ?to - equipment)
    :duration (= ?duration 0.1)
    :condition (and
        (at start (location-change ?from ?to))
        (at start (at ?p ?from))

        (at end (at ?p ?to))
    )
    :effect (and
        (at start (moving))

        (at end (not (moving)))
    )
)





)


