( define
  ( tasks Depots-tasks )

  ( :task Make-3Crate
    :parameters
    (
      ?p0 - surface
      ?c1 - surface
      ?c2 - surface
      ?c3 - surface
    )
    :precondition
    (
    )
    :effect
    ( and
      ( clear ?c3 )
      ( on ?c3 ?c2 )
      ( on ?c2 ?c1 )
      ( on ?c1 ?p0 )
    )
  )

)
