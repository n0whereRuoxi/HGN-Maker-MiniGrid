( define 
  ( tasks Blocks4-tasks )

  ( :task Make-3Pile
    :parameters
    (
      ?b1 - block
      ?b2 - block
      ?b3 - block    
    )
    :precondition
    (
    )
    :effect
    ( and
      ( clear ?b3 )
      ( on ?b3 ?b2 )
      ( on ?b2 ?b1 )
      ( on-table ?b1 )
    )
  )

)
