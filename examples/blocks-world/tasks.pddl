( define 
  ( tasks Blocks4-tasks )

  ( :task Make-1Pile
    :parameters
    (
      ?block - block
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on-table ?block )
      ( clear ?block )
    )
  )

  ( :task Make-Clear
    :parameters
    (
      ?theblock - block
    )
    :precondition
    (
    )
    :effect
    ( and
      ( clear ?theblock)
    )
  )

)

