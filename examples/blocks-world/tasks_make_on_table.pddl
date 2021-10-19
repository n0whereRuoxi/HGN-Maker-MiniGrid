( define 
  ( tasks Blocks4-tasks )

  ( :task Make-On-Table
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
    )
  )

)
