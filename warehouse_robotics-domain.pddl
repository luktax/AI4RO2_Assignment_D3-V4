;Header and description

(define (domain warehouse-robotics)

;remove requirements that are not needed
(:requirements :strips :typing :fluents :negative-preconditions :adl)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    robot package location
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (robot-at ?r - robot ?loc - location)
    (package-at ?p - package ?loc - location)
    (loaded ?r - robot ?p - package)
)


(:functions ;todo: define numeric functions here
    (weight ?p - package)
    (size ?p - package)

    (max-weight ?r - robot)
    (max-size ?r - robot)

    (current-weight ?r - robot)
    (current-size ?r - robot)
)

;define actions here
(:action move
    :parameters (?r - robot ?from - location ?to - location)
    :precondition (and (robot-at ?r ?from)
                     (=(current-weight ?r) 0)
                     (= (current-size ?r) 0))
    :effect (and (robot-at ?r ?to) 
                (not (robot-at ?r ?from)))
)
(:action delivery-trip
    :parameters (?r - robot ?from - location ?to - location)
    :precondition (and (robot-at ?r ?from)
                     (not (exists (?p - package) (and
                        (package-at ?p ?from)
                        (<=(+ (current-weight ?r) (weight ?p)) (max-weight ?r))
                        (<= (+ (current-size ?r) (size ?p)) (max-size ?r))
                     ))))
    :effect (and (robot-at ?r ?to) 
                (not (robot-at ?r ?from)))
)

(:action load
    :parameters (?r - robot ?p - package ?loc - location)
    :precondition (and (robot-at ?r ?loc)
                     (package-at ?p ?loc)
                     (not (loaded ?r ?p))
                     (<= (+ (current-weight ?r) (weight ?p)) (max-weight ?r))
                     (<= (+ (current-size ?r) (size ?p)) (max-size ?r)))
    :effect (and (loaded ?r ?p) 
                (not (package-at ?p ?loc))
                (increase (current-weight ?r) (weight ?p))
                (increase (current-size ?r) (size ?p)))
)

(:action unload
    :parameters (?r - robot ?p - package ?loc - location)
    :precondition (and (loaded ?r ?p) (robot-at ?r ?loc))
    :effect (and (package-at ?p ?loc) 
                (not (loaded ?r ?p))
                (decrease (current-weight ?r) (weight ?p))
                (decrease (current-size ?r) (size ?p)))
)

)