(define (problem warehouse-test-multitrip)
  (:domain warehouse-robotics)
  
  (:objects
    robot1 - robot
    p1 p2 p3 - package
    warehouse delivery1 - location
  )
  
  (:init
    ; --- Posizioni iniziali ---
    (robot-at robot1 warehouse)
    (package-at p1 warehouse)
    (package-at p2 warehouse)
    (package-at p3 warehouse)
    (delivery-station delivery1)
    
    ; --- Costanti dei pacchi ---
    ; Pacco 1: Peso 4
    (= (weight p1) 4.0)
    (= (size p1) 4.0)
    
    ; Pacco 2: Peso 5
    (= (weight p2) 5.0)
    (= (size p2) 5.0)
    
    ; Pacco 3: Peso 4
    ; TOTALE PESO = 13.0 (Il robot può portare massimo 10.0!)
    (= (weight p3) 4.0)
    (= (size p3) 4.0)
    
    ; --- Costanti del robot ---
    (= (max-weight robot1) 10.0)
    (= (max-size robot1) 10.0)
    
    ; --- Variabili azzerate alla partenza ---
    (= (current-weight robot1) 0.0)
    (= (current-size robot1) 0.0)
    (= (loading-temp-weight robot1) 0.0)
    (= (loading-temp-size robot1) 0.0)
    (= (loading-progress robot1) 0.0)
    (= (unload-progress robot1) 0.0)
  )
  
  (:goal
    (and 
        ; Tutti i pacchi devono arrivare a destinazione
        (package-at p1 delivery1)
        (package-at p2 delivery1)
        (package-at p3 delivery1)
    )
  )
)