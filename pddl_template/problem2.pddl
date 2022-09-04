;It's recommended to install the misc-pddl-generators plugin 
;and then use Network generator to create the graph
(define (problem p2-UpdsideDown)
  (:domain UpdsideDown)
  (:objects
    cell1 cell3 cell2 cell4 cell5 cell6 cell7 cell8 cell9 cell10 cell11 cell12 cell13 cell14 cell15 - cells
    red green blue - colour
    m1 m2 - matches
    k1 k2 - keys
  )
  (:init

    ;Initial Hero Location
    (location_hero cell1)
    ;She starts with a free arm
    (empty_handed)
    ;Initial location of the keys k1:red key in cell1. k2: green key in cell11
    (has_key k1 cell1)
    (has_key k2 cell11)

    
    ;Initial location of the matches
    (has_match m1 cell6)
    (has_match m2 cell13)
    ;Initial location of Monsters
    (location_monster cell14)
    ;Initial lcocation of open gates 
    (has_gate cell2)
    (has_gate cell3)
    (has_gate cell4)
    (has_gate cell5)
    (has_gate cell7)
    (has_gate cell8)
    (has_gate cell9)
    (has_gate cell10)
    (has_gate cell12)
    
    (color_gate cell2 red)
    (color_gate cell3 red)
    (color_gate cell4 red)
    (color_gate cell5 red)
    (color_gate cell7 red)
    (color_gate cell8 red)
    (color_gate cell9 red)
    (color_gate cell10 red)
    (color_gate cell12 green)

    
    ;Key uses
    (key-two-use k2)
    (key-infinite-uses k1)
    
    ;Key Colours
    (color_key k1 red)
    (color_key k2 green)

    
    ;Graph Connectivity
    (connected cell1 cell3)
    (connected cell3 cell1)
    (connected cell2 cell3)
    (connected cell3 cell2)
    (connected cell3 cell4)
    (connected cell4 cell3)
    (connected cell2 cell5)
    (connected cell5 cell2)
    (connected cell5 cell6)
    (connected cell6 cell5)
    (connected cell6 cell7)
    (connected cell7 cell6)
    (connected cell4 cell7)
    (connected cell7 cell4)
    (connected cell6 cell4)
    (connected cell4 cell6)
    (connected cell3 cell6)
    (connected cell6 cell3)
    (connected cell2 cell6)
    (connected cell6 cell2)
    (connected cell5 cell8)
    (connected cell8 cell5)
    (connected cell6 cell9)
    (connected cell9 cell6)
    (connected cell6 cell8)
    (connected cell8 cell6)
    (connected cell9 cell8)
    (connected cell8 cell9)
    (connected cell10 cell9)
    (connected cell9 cell10)
    (connected cell6 cell10)
    (connected cell10 cell6)
    (connected cell7 cell10)
    (connected cell10 cell7)
    (connected cell9 cell11)
    (connected cell11 cell9)
    (connected cell11 cell12)
    (connected cell12 cell11)
    (connected cell12 cell13)
    (connected cell13 cell12)
    (connected cell13 cell14)
    (connected cell14 cell13)
    (connected cell14 cell15)
    (connected cell15 cell14)
    
  )
  (:goal (and
                ;Hero's Goal Location
                (location_hero cell15)
                ;All gates are closed
                (closed_gate cell2)
                (closed_gate cell3)
                (closed_gate cell4)
                (closed_gate cell5)
                (closed_gate cell7)
                (closed_gate cell8)
                (closed_gate cell9)
                (closed_gate cell10)
                (closed_gate cell12)
                
  ))
  
)