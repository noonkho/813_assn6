;Header and description

(define (domain gym_v3)

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
    no_equip - equipment
)

(:predicates
    (not-exercising)
    (current-exercise ?p - person ?e - exercise)
    (exercise-change ?p - person ?e1 ?e2 - exercise)
    (idle)

    (using ?eq - equipment)
    (requires ?e - exercise ?equipment)

    ; (at ?p - person ?eq - equipment)
    ; (equip-change ?e1 ?e2 - equipment)
)


(:functions

    (exe-length ?l - length)

    (exe-count ?p - person ?e - exercise)
    (exe-duration ?p - person ?e - exercise)
    
    (workout_duration ?p - person)
    
)

(:durative-action do-equip-exercise
    :parameters (?p - person ?eq - equipment ?e - exercise ?l - length)
    :duration (= ?duration (exe-length ?l))
    :condition (and
        (at start (not-exercising))
        
        (at start (idle))
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


(:durative-action do-exercise
    :parameters (?p - person ?e - exercise ?l - length)
    :duration (= ?duration (exe-length ?l))
    :condition (and
        (at start (not-exercising))

        (at start (idle))
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


(:durative-action take_break ; you must take break in between exercises (or else you will die)
        :parameters (?p - person ?from ?to - exercise)
        :duration (= ?duration 5)
        :condition (and
            (at start (current-exercise ?p ?from))
            (at start (exercise-change ?p ?from ?to))
            (at end (current-exercise ?p ?to))
        ) 
        :effect (and
            (at start (idle))
            (at end (not (idle)))
        )
)

(:durative-action move
    :parameters (?p - person ?from ?to - equipment)
    :duration (= ?duration 3)
    :condition (and 
        (at start (and 
        ))
        (over all (and 
        ))
        (at end (and 
        ))
    )
    :effect (and 
        (at start (and 
        ))
        (at end (and 
        ))
    )
)




)


