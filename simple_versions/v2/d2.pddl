;Header and description

(define (domain gym_v2)

;remove requirements that are not needed
(:requirements :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

(:types
    exercise
    length
    person
)

(:constants 
    warmup - exercise
)

(:predicates
    (not-exercising ?p - person)
    (current-exercise ?p - person ?e - exercise)
    (exercise-change ?e1 ?e2 - exercise)
    (idle ?p - person)

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
    :parameters (?p - person ?e - exercise ?l - length)
    :duration (= ?duration (exe-length ?l))
    :condition (and
        (at start (not-exercising ?p))
        (at start (idle ?p))
        (at start (< (exe-count ?p ?e) (max-exercise-count)))
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


(:durative-action take_break ; you must take break in between exercises (or else you will die)
        :parameters (?p - person ?from ?to - exercise)
        :duration (= ?duration 0.1)
        :condition (and
            (at start (current-exercise ?p ?from))
            (at start (exercise-change ?from ?to))
            (at end (current-exercise ?p ?to))
        ) 
        :effect (and
            (at start (idle ?p))
            (at end (not (idle ?p)))
        )
)



)


