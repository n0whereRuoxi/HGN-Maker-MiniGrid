( define
  ( tasks Depots-tasks )

  ( :task Make-2Crate
    :parameters
    (
      ?p0 - surface
      ?c1 - surface
      ?c2 - surface
    )
    :precondition
    (
    )
    :effect
    ( and
      ( clear ?c2 )
      ( on ?c2 ?c1 )
      ( on ?c1 ?p0 )
    )
  )

)
