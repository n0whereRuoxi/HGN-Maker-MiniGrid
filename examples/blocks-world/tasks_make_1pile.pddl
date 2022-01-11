( define 
  ( tasks Blocks4-tasks )

  ( :task Make-1Pile
    :parameters
    (
      ?b1 - block
    )
    :precondition
    (
    )
    :effect
    ( and
      ( clear ?b1 )
      ( on-table ?b1 )
    )
  )

)
