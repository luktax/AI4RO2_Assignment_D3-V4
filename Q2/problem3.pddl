(define (problem warehouse-advanced-test)
  (:domain warehouse-robotics)
  
  (:objects
    r1 r2 - robot
    p1 p2 p3 p4 - package
    zone-A zone-B dispatch-1 - location
  )
  
  (:init
    (delivery-station dispatch-1)
    
    (robot-at r1 zone-A)
    (robot-at r2 dispatch-1)
    
    (package-at p1 zone-A)
    (package-at p2 zone-A)
    (package-at p3 zone-B)
    (package-at p4 zone-B)
    
    ; --- Proprietà Pacchi ---
    (= (weight p1) 6.0) (= (size p1) 6.0)
    (= (weight p2) 5.0) (= (size p2) 5.0)
    
    (= (weight p3) 12.0) (= (size p3) 12.0)
    (= (weight p4) 8.0)  (= (size p4) 8.0)
    
    ; --- Proprietà Robot 1 ---
    (= (max-weight r1) 10.0)
    (= (max-size r1) 10.0)
    (= (current-weight r1) 0.0)
    (= (current-size r1) 0.0)
    (= (loading-temp-weight r1) 0.0)
    (= (loading-temp-size r1) 0.0)
    (= (loading-progress r1) 0.0)
    (= (unload-progress r1) 0.0)

    ; --- Proprietà Robot 2 ---
    (= (max-weight r2) 20.0)
    (= (max-size r2) 20.0)
    (= (current-weight r2) 0.0)
    (= (current-size r2) 0.0)
    (= (loading-temp-weight r2) 0.0)
    (= (loading-temp-size r2) 0.0)
    (= (loading-progress r2) 0.0)
    (= (unload-progress r2) 0.0)
  )
  
  (:goal
    (and 
        (package-at p1 dispatch-1)
        (package-at p2 dispatch-1)
        (package-at p3 dispatch-1)
        (package-at p4 dispatch-1)
    )
  )
)