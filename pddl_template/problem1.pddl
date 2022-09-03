;It's recommended to install the misc-pddl-generators plugin 
;and then use Network generator to create the graph
(define (problem p1-UpdsideDown)
  (:domain UpdsideDown)
  (:objects
    cell1 cell2 cell3 cell cell5 cell8 cell6 cell4 cell9 cell10 cell7 cell11 - cells
    red green blue - colour
    m1 - matches
    k1 k2 k3 - keys
    g1 g2 g3 - gates
  )
  (:init

    ;Initial Hero Location
    (location_hero cell1)
    ;She starts with a free arm
    (empty_handed)
    ;Initial location of the keys k1:red key in cell2. k2: green key in cell8. k3: blue key in cell10
    (has_key k1 cell2)
    (has_key k2 cell8)
    (has_key k3 cell10)
    
    ;Initial location of the matches
    (has_match m1 cell4)
    ;Initial location of Monsters
    (location_monster cell3)
    ;Initial lcocation of open gates g1: gate in cell5, g2: gate in cell6, g3: gate in cell9, g4:gate in cell7
    (closes k1 g1) 
    (closes k2 g2) 
    (closes k2 g3)
    (closes k3 g4)
    (has_gate cell5)
    (has_gate cell6)
    (has_gate cell9)
    (has_gate cell7)
    
    ;Key uses
    (key-two-use k2)
    (key-one-use k3)
    (key-used-up k1)
    
    ;Key Colours
    (key_color k1 red)
    (key_color k2 green)
    (key_color k3 blue)
    ;Graph Connectivity
    (connected cell1 cell2)
    (connected cell2 cell1)
    (connected cell2 cell3)
    (connected cell3 cell2)
    (connected cell3 cell)
    (connected cell cell3)
    (connected cell2 cell5)
    (connected cell5 cell2)
    (connected cell5 cell8)
    (connected cell8 cell5)
    (connected cell5 cell6)
    (connected cell6 cell5)
    (connected cell3 cell4)
    (connected cell4 cell3)
    (connected cell8 cell9)
    (connected cell9 cell8)
    (connected cell9 cell10)
    (connected cell10 cell9)
    (connected cell9 cell6)
    (connected cell6 cell9)
    (connected cell6 cell3)
    (connected cell3 cell6)
    (connected cell6 cell7)
    (connected cell7 cell6)
    (connected cell10 cell7)
    (connected cell7 cell10)
    (connected cell7 cell4)
    (connected cell4 cell7)
    (connected cell3 cell11)
    (connected cell11 cell3)
    
  )
  (:goal (and
                ;Hero's Goal Location
                (location_hero cell11)
                ;All gates are closed
                (closed g1)
                (closed g2)
                (closed g3)
                (closed g4)
                
  ))
  
)