( define 
  ( tasks Blocks4-tasks )

  ( :task Make-2Pile
    :parameters
    (
      ?b1 - block
      ?b2 - block
    )
    :precondition
    (
    )
    :effect
    ( and
      ( clear ?b2 )
      ( on ?b2 ?b1 )
      ( on-table ?b1 )
    )
  )

)
