;It's recommended to install the misc-pddl-generators plugin 
;and then use Network generator to create the graph
(define (problem p3-UpdsideDown)
  (:domain UpdsideDown)
  (:objects
    cell1 cell2 cell8 cell3 cell9 cell10 cell4 cell11 cell5 cell6 cell12 cell13 cell7 - cells
    red green blue - colour
    m1 - matches
    k1 k2 k3 - keys
  )
  (:init

    ;Initial Hero Location
    (location_hero cell1)
    ;She starts with a free arm
    (empty_handed)
    ;Initial location of the keys k1:red key in cell9. k2: green key in cell5. k3: blue key in cell12
    (has_key k1 cell9)
    (has_key k2 cell5)
    (has_key k3 cell12)
    
    ;Initial location of the matches
    (has_match m1 cell5)
    
    ;Initial location of Monsters
    (location_monster cell11)
    ;Initial lcocation of open gates 
    (has_gate cell2)
    (has_gate cell3)
    (has_gate cell8)
    (has_gate cell10)
    (has_gate cell4)
    (has_gate cell6)
    (has_gate cell12)
    (has_gate cell7)
    (color_gate cell2 red)
    (color_gate cell3 red)
    (color_gate cell8 red)
    (color_gate cell10 red)
    (color_gate cell7 red)
    (color_gate cell4 green)
    (color_gate cell6 green)
    (color_gate cell12 blue)
    
    ;Key uses
    (key-two-use k2)
    (key-one-use k3)
    (key-infinite-uses k1)
    
    ;Key Colours
    (color_key k1 red)
    (color_key k2 green)
    (color_key k3 blue)
    
    
    ;Graph Connectivity
    (connected cell1 cell2)
    (connected cell2 cell1)
    (connected cell1 cell8)
    (connected cell8 cell1)
    (connected cell8 cell3)
    (connected cell3 cell8)
    (connected cell2 cell9)
    (connected cell9 cell2)
    (connected cell8 cell9)
    (connected cell9 cell8)
    (connected cell2 cell3)
    (connected cell3 cell2)
    (connected cell9 cell10)
    (connected cell10 cell9)
    (connected cell3 cell10)
    (connected cell10 cell3)
    (connected cell9 cell4)
    (connected cell4 cell9)
    (connected cell3 cell4)
    (connected cell4 cell3)
    (connected cell4 cell11)
    (connected cell11 cell4)
    (connected cell10 cell5)
    (connected cell5 cell10)
    (connected cell4 cell5)
    (connected cell5 cell4)
    (connected cell10 cell11)
    (connected cell11 cell10)
    (connected cell5 cell6)
    (connected cell6 cell5)
    (connected cell5 cell12)
    (connected cell12 cell5)
    (connected cell11 cell6)
    (connected cell6 cell11)
    (connected cell11 cell12)
    (connected cell12 cell11)
    (connected cell6 cell13)
    (connected cell13 cell6)
    (connected cell12 cell7)
    (connected cell7 cell12)
    (connected cell12 cell13)
    (connected cell13 cell12)
    (connected cell6 cell7)
    (connected cell7 cell6)
    
  )
  (:goal (and
                ;Hero's Goal Location
                (location_hero cell13)
                ;All gates are closed
                (closed_gate cell2)
                (closed_gate cell3)
                (closed_gate cell8)
                (closed_gate cell10)
                (closed_gate cell4)
                (closed_gate cell6)
                (closed_gate cell12)
                (closed_gate cell7)
  ))
  
)