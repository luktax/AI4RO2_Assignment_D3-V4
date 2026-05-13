(define (problem problem-warehouse_robotics-3) 
    (:domain warehouse-robotics)
(:objects 
    robot1 - robot
    package1 package2 package3 package4 - package
    locationA locationB locationC - location
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (robot-at robot1 locationA)
    (package-at package1 locationB) 
    (package-at package2 locationB)
    (package-at package3 locationB)
    (package-at package4 locationB)
    (delivery-station locationC)

    (= (weight package1) 8)
    (= (weight package2) 7)
    (= (weight package3) 2)
    (= (weight package4) 3)

    (= (size package1) 2)
    (= (size package2) 2)
    (= (size package3) 1)
    (= (size package4) 1)

    (= (max-weight robot1) 10)
    (= (max-size robot1) 5)

    (= (current-weight robot1) 0)
    (= (current-size robot1) 0)
    (= (total-cost) 0)

)

(:goal (and
    ;todo: put the goal condition here
    (package-at package1 locationC)
    (package-at package2 locationC)
    (package-at package3 locationC)
    (package-at package4 locationC)
))

;un-comment the following line if metric is needed
(:metric minimize (total-cost))
)
