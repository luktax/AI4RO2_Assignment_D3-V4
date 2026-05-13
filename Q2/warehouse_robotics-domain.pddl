;Header and description

(define (domain warehouse-robotics)

;remove requirements that are not needed
(:requirements :strips :typing :fluents :negative-preconditions :adl :continuous-effects :durative-actions :time :existential-preconditions)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    robot package location
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (robot-at ?r - robot ?loc - location)
    (package-at ?p - package ?loc - location)
    (loaded ?r - robot ?p - package)
    (delivery-station ?loc - location)
    (loading ?r - robot ?p - package)
    (unloading ?r - robot ?p - package)
    (busy ?r - robot)
)


(:functions ;todo: define numeric functions here
    (weight ?p - package)
    (size ?p - package)

    (max-weight ?r - robot)
    (max-size ?r - robot)

    (loading-temp-weight ?r - robot)
    (current-weight ?r - robot)
    (loading-temp-size ?r - robot)
    (current-size ?r - robot)

    (loading-progress ?r - robot)
    (unload-progress ?r - robot)
)

;define actions here
(:action move
    :parameters (?r - robot ?from - location ?to - location)
    :precondition (and (robot-at ?r ?from)
                     (= (current-weight ?r) 0)
                     (= (current-size ?r) 0)
                     (not (busy ?r))
                    )
    :effect (and (robot-at ?r ?to) 
                 (not (robot-at ?r ?from)))
)

(:action delivery-trip
    :parameters (?r - robot ?from - location ?to - location)
    :precondition (and (delivery-station ?to)
                       (robot-at ?r ?from)
                       (> (current-weight ?r) 0)
                       (not (busy ?r))
                    )
    :effect (and (robot-at ?r ?to) 
                (not (robot-at ?r ?from)))
)

(:action start-loading
    :parameters (?r - robot ?p - package ?loc - location)
    :precondition (and (robot-at ?r ?loc)
                     (package-at ?p ?loc)
                     (not (loaded ?r ?p))
                     (not (busy ?r))
                    )
    :effect (and (loading ?r ?p)
                (assign (loading-progress ?r) 0)
                (assign (loading-temp-weight ?r) (current-weight ?r))
                (assign (loading-temp-size ?r) (current-size ?r))
                (busy ?r)
            )
)

(:process loading-process
    :parameters (?r - robot ?p - package)
    :precondition (and (loading ?r ?p)                 
        ; activation condition
    )
    :effect (and (increase (loading-progress ?r) (* #t (/ 1 (weight ?p))))
            (increase (loading-temp-weight ?r) (* #t (/ (weight ?p) (weight ?p))))
            (increase (loading-temp-size ?r) (* #t (/ (size ?p) (weight ?p))))
        ; continuous effect(s)
    )
)

(:event finish-loading
    :parameters (?r - robot ?p - package ?loc - location)
    :precondition (and (loading ?r ?p)
                     (robot-at ?r ?loc)
                     (package-at ?p ?loc)
                     (>= (loading-progress ?r) 1)
                     (<= (loading-temp-weight ?r) (max-weight ?r))
                     (<= (loading-temp-size ?r) (max-size ?r))
                     )
    :effect (and (loaded ?r ?p) 
                (not (package-at ?p ?loc))
                (not (loading ?r ?p))
                (assign (loading-progress ?r) 0)
                (assign (current-weight ?r) (loading-temp-weight ?r))
                (assign (current-size ?r) (loading-temp-size ?r))
                (not (busy ?r))
            )
)

(:event overload
    :parameters (?r - robot ?p - package)
    :precondition (and (loading ?r ?p)
                       (or (> (loading-temp-size ?r) (max-size ?r))
                           (> (loading-temp-weight ?r) (max-weight ?r)))
                     )
    :effect (and (not (loading ?r ?p))
                (not (loaded ?r ?p))
                (assign (loading-progress ?r) 0)
                (assign (loading-temp-size ?r) (current-size ?r))
                (assign (loading-temp-weight ?r) (current-weight ?r))
                (not (busy ?r))
            )
)

(:action start-unloading
    :parameters (?r - robot ?p - package ?loc - location)
    :precondition (and (loaded ?r ?p) 
                        (robot-at ?r ?loc) 
                        (not (unloading ?r ?p))
                        (delivery-station ?loc)
                        (not (busy ?r))
                    )
    :effect (and (unloading ?r ?p)
                (assign (unload-progress ?r) 0)
                (busy ?r)
            )  
)

(:process unloading-process
    :parameters (?r - robot ?p - package)
    :precondition (and (unloading ?r ?p)
        ; activation condition
    )
    :effect (and (increase (unload-progress ?r) (* #t (/ 1 (weight ?p))))
            (decrease (current-weight ?r) (* #t (/ (weight ?p) (weight ?p))))
            (decrease (current-size ?r) (* #t (/ (size ?p) (weight ?p))))
        ; continuous effect(s)
    )
)

(:event finish-unloading
    :parameters (?r - robot ?p - package ?loc - location)
    :precondition (and (unloading ?r ?p)
                       (>= (unload-progress ?r) 1)
                       (robot-at ?r ?loc))
    :effect (and (package-at ?p ?loc)
                (not (unloading ?r ?p))
                (not (loaded ?r ?p))
                (assign (unload-progress ?r) 0)
                (not (busy ?r))
            )
)

;(:action wait-for-completion
;    :parameters (?r - robot)
;    :precondition (and (or (exists (?p - package) (and (loading ?r ?p)
;                                                        (>= (loading-progress ?r) 1)))
;                           (exists (?p - package) (and (unloading ?r ?p)
;                                                       (>= (unload-progress ?r) 1)))))
;    :effect (and)
;)


)