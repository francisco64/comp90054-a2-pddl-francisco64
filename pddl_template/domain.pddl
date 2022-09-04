(define (domain UpdsideDown)

    (:requirements
        :typing
        :negative-preconditions
        :conditional-effects
    )

    (:types
        matches keys gates - items
        cells
        colour
    )

    (:predicates
        
        ;Indicates the number of uses left in a key
        (key-infinite-uses ?k - keys)
        
        (key-two-use ?k - keys)
        
        (key-one-use ?k - keys)
        
        (key-used-up ?k - keys)

        ;Add other predicates needed to model this domain 
        (location_hero ?c - cells)
        (has_key ?k - keys ?c - cells)
        (has_match ?m - matches ?c - cells)
        (key_color ?k - keys ?c - colour)
        (location_monster ?c - cells)
        (closes ?k - keys ?g - gates)
        (has_gate ?c - cells)
        (closed ?g - gates)
        (visited ?c - cells)
        (empty_handed)
        (connected ?from ?to -cells)
        (match_handed)
        (key_handed)
        (match_striked ?m - matches)
    )

    ;Hero can move if the
    ;    - hero is at current location
    ;    - cells are connected, 
    ;    - there is no monster in current loc and destination, and 
    ;    - destination is not invigilated
    ;Effects move the hero, and the original cell becomes invigilated.
    (:action move
        :parameters (?from ?to - cells)
        :precondition (and 
        (location_hero ?from)
        (connected ?from ?to)
        (not (location_monster ?from))
        (not (location_monster ?to))
        (not (visited ?to))
        )
        :effect (and 
        (location_hero ?to)
        (not (location_hero ?from) )
        (visited ?from)
                            
                )
    )
    
    ;When this action is executed, the hero leaves a location with a monster in it
    (:action move-out-of-monster
        :parameters (?from ?to - cells)
        :precondition (and 
        (location_hero ?from)
        (connected ?from ?to)
        (location_monster ?from)
        (not (visited ?to))
        )
        :effect (and 
        (not (location_hero ?from))  
        (location_hero ?to)
        (visited ?from)
        
                )
    )

    ;When this action is executed, the hero leaves a location without a monster and gets into a location with a monster
    (:action move-into-monster
        :parameters (?from ?to - cells ?m - matches)
        :precondition (and 
        (location_hero ?from)
        (connected ?from ?to)
        (location_monster ?to)
        (not (visited ?to))  
        (match_handed)
        (not (match_striked ?m))
        
        )
        :effect (and 
        (not (location_hero ?from))  
        (location_hero ?to)
        (visited ?from)
        (match_striked ?m)
                )
    )
    
    ;Hero's picks a key if he's in the same location
    (:action pick-key
        :parameters (?loc - cells ?k - keys)
        :precondition (and 
        (location_hero ?loc)
        (has_key ?k ?loc)
        (empty_handed)
        
                      )
        :effect (and
        (key_handed)
        (not (has_key ?k ?loc))
        (not (empty_handed))
                            
                )
    )

    ;Hero's picks a match if he's in the same location
    (:action pick-match
        :parameters (?loc - cells ?m - matches)
        :precondition (and 
        (location_hero ?loc)
        (has_match ?m ?loc)
        (empty_handed)
                      )
        :effect (and
        (not (empty_handed))
        (match_handed)
        (not (has_match ?m ?loc))
                )
    )
    
   ;Hero's drops his key. 
    (:action drop-key
        :parameters (?loc - cells ?k - keys)
        :precondition (and 
        (not (empty_handed))
        (key_handed)
                            
                      )
        :effect (and
        (has_key ?k ?loc)
        (empty_handed)
        (not (key_handed))              
                )
    )

    ;Hero's drops his match. 
    (:action drop-match
        :parameters (?loc - cells ?m - matches)
        :precondition (and 
        (not (empty_handed))
        (match_handed)
        
                      )
        :effect (and
        (has_match ?m ?loc)
        (empty_handed)
        (not (match_handed))
                )
    )
    
    ;Hero's disarm the trap with his hand
    (:action close-gate
        :parameters (?from ?to - cells ?k - keys ?c - colour ?g - gates)
        :precondition (and 
        (has_gate ?to)
        (closes ?k ?g)
        (not (key-used-up ?k))
                      )
        :effect (and
                    (closed ?g)
                    ;When a key has two uses, then it becomes a single use
                    (when (key-two-use ?k) (key-one-use ?k))
                    ;When a key has a single use, it becomes used-up
                    (when (key-one-use ?k) (key-used-up ?k))       
                )
    )

    ;Hero strikes her match
    (:action strike-match
        :parameters (?m - matches)
        :precondition (and 
        (match_handed)
        (not (match_striked ?m))
        )
        :effect (and 
        (match_striked ?m)              
        )
    )
    
)