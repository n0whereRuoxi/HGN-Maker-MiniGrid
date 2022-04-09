( define
  ( tasks depots-tasks )
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
      ( on ?c1 ?p0 )
      ( clear ?c1 )
    )
  )
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
      ( on ?c1 ?p0 )
      ( on ?c2 ?c1 )
      ( clear ?c2 )
    )
  )
)
