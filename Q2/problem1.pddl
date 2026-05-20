(define (problem warehouse-test-minimal)
  (:domain warehouse-robotics)
  
  (:objects
    robot1 - robot
    package1 package2 package3 - package
    warehouse delivery1 - location
  )
  
  (:init
    (robot-at robot1 warehouse)
    (package-at package1 warehouse)
    (package-at package2 warehouse)
    (package-at package3 warehouse)
    (delivery-station delivery1)
    
    (= (weight package1) 2)
    (= (size package1) 1)
    (= (weight package2) 3)
    (= (size package2) 2)
    (= (weight package3) 4)
    (= (size package3) 3)
    (= (max-weight robot1) 10)
    (= (max-size robot1) 10)
    (= (current-weight robot1) 0)
    (= (current-size robot1) 0)
    (= (loading-progress robot1) 0)
    (= (unload-progress robot1) 0)
    (= (loading-temp-weight robot1) 0)
    (= (loading-temp-size robot1) 0)
  )
  
  (:goal
    (and (package-at package1 delivery1)
          (package-at package2 delivery1)
          (package-at package3 delivery1) 
    )
  )
)