( define 
  ( tasks Blocks4-tasks )

  ( :task Make-On
    :parameters
    (
      ?above - block
      ?below - block
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on ?above ?below )
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
