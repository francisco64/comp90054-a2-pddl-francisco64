;It's recommended to install the misc-pddl-generators plugin 
;and then use Network generator to create the graph
(define (problem p4-UpdsideDown)
  (:domain UpdsideDown)
  (:objects
    cell1 cell2 cell3 cell4 cell5 cell6 cell cell7 - cells
    red green blue - colour
    k1 k2 k3 - keys
  )
  (:init

    ;Initial Hero Location
    (location_hero cell1)
    ;She starts with a free arm
    (empty_handed)
    ;Initial location of the keys k1:red key in cell1. k2: green key in cell3. k3: blue key in cell5
    (has_key k1 cell1)
    (has_key k2 cell3)
    (has_key k3 cell5)
    
    ;Initial location of the matches
    ;(has_match m1 cell4)
    ;Initial location of Monsters
    ;(location_monster cell3)
    ;Initial lcocation of open gates 
    (has_gate cell2)
    (has_gate cell4)
    (has_gate cell6)
    
    (color_gate cell2 red)
    (color_gate cell4 green)
    (color_gate cell6 blue)
    
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
    (connected cell2 cell3)
    (connected cell3 cell2)
    (connected cell3 cell4)
    (connected cell4 cell3)
    (connected cell4 cell5)
    (connected cell5 cell4)
    (connected cell5 cell6)
    (connected cell6 cell5)
    (connected cell6 cell)
    (connected cell cell6)
    (connected cell6 cell7)
    (connected cell7 cell6)
    
  )
  (:goal (and
                ;Hero's Goal Location
                (location_hero cell7)
                (closed_gate cell2)
                (closed_gate cell4)
                (closed_gate cell6)
  ))
  
)