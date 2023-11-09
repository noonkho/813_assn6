;Header and description

(define (domain gym_v1)

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
    (not-exercising)
    (current-exercise ?p - person ?e - exercise)
    (exercise-change ?p - person ?e1 ?e2 - exercise)
    (idle)
)


(:functions

    (exe-length ?l - length)

    (exe-count ?p - person ?e - exercise)
    (exe-duration ?p - person ?e - exercise)
    
    (workout_duration ?p - person)
    
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



)


