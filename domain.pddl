;Header and description

(define (domain gym_v5)

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
    (not-exercising ?p - person)
    (current-exercise ?p - person ?e - exercise)

    (exercise-change ?e1 ?e2 - exercise)
    (idle ?p - person)

    (exercise-need ?e - exercise ?eq - equipment)
    (at ?p - person ?eq - equipment)
    (not-using ?eq - equipment)
    (location-change ?eq1 ?eq2 - equipment)
    (equal ?eq1 ?eq2 - equipment)
    (not-moving ?p - person)
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
        (at start (not-exercising ?p))
        (at start (< (exe-count ?p ?e) (max-exercise-count)))

        (at start (idle ?p))

        (at start (exercise-need ?e ?eq))

        (over all (at ?p ?eq))
        (at start (not-moving ?p))
    )
    :effect (and
        (at start (not (not-exercising ?p)))
        (at start (not (current-exercise ?p warmup)))
        (at start (current-exercise ?p ?e))

        (at end (and
            (not-exercising ?p)
            (increase (exe-count ?p ?e) 1)
            (increase (exe-duration ?p ?e) (exe-length ?l))
            (increase (workout_duration ?p) (exe-length ?l))
            (not (current-exercise ?p ?e))
        ))
    )
)


(:durative-action take_break ; you must take break in between exercises (or else you will die :p)
        :parameters (?p - person ?from ?to - exercise)
        :duration (= ?duration 1)
        :condition (and
            (at start (current-exercise ?p ?from))
            (at start (exercise-change ?from ?to))
            (at start (< (exe-count ?p ?to) (max-exercise-count)))
            (at end (current-exercise ?p ?to))
        ) 
        :effect (and
            (at start (idle ?p))

            (at end (not (idle ?p)))
        )
)


(:durative-action move_and_using
    :parameters (?p - person ?from ?to - equipment)
    :duration (= ?duration 30.5)
    :condition (and
        (at start (location-change ?from ?to))
        (at start (at ?p ?from))
        (at start (not-using ?to))
        
        (at end (at ?p ?to))
    )
    :effect (and
        (at start (not-moving ?p))
        (at start (not (at ?p ?from)))
        (at start (at ?p ?to))
        (at start (not (not-using ?to)))

        (at end (not (not-moving ?p)))
        (at end (not-using ?to))
        (at start (not (at ?p ?to)))
    )
)





)


