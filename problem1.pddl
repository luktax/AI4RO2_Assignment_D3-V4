(define (problem problem-warehouse_robotics-1) 
    (:domain warehouse-robotics)
(:objects 
    robot1 - robot
    package1 package2 package3 - package
    locationA locationB locationC - location
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (robot-at robot1 locationA)
    (package-at package1 locationB)
    (package-at package2 locationB)
    (package-at package3 locationB)
    
    (= (weight package1) 2)
    (= (weight package2) 3)
    (= (weight package3) 4)

    (= (size package1) 1)
    (= (size package2) 2)
    (= (size package3) 3)

    (= (max-weight robot1) 5)
    (= (max-size robot1) 3)

    (= (current-weight robot1) 0)
    (= (current-size robot1) 0)
)

(:goal (and
    ;todo: put the goal condition here
    (package-at package1 locationC)
    (package-at package2 locationC)
    (package-at package3 locationC)
))

;un-comment the following line if metric is needed
;(:metric minimize ())
)
