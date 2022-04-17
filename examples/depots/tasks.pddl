( define
  ( tasks Depots-tasks )

  ( :task Make-On
    :parameters
    (
      ?above - surface
      ?below - surface
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
      ?it - surface
    )
    :precondition
    (
    )
    :effect
    ( and
      ( clear ?it )
    )
  )

  ( :task Make-Keep-Clear
    :parameters
    (
      ?it - surface
      ?leave - surface
    )
    :precondition
    (
    )
    :effect
    ( and
      ( clear ?it )
      ( clear ?leave )
    )
  )
)
