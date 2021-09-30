( define
  ( tasks blocks4-tasks )

  ( :task make-on-table
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

  ( :task make-on
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
      ( on ?b1 ?b2 )
    )
  )

)
