( define
  ( tasks Depots-tasks )

  ( :task Make-1Crate
    :parameters
    (
      ?p0 - surface
      ?c1 - surface
    )
    :precondition
    (
    )
    :effect
    ( and
      ( clear ?c1 )
      ( on ?c1 ?p0 )
    )
  )

)
