( define ( tasks logistics-tasks )

  ( :task DELIVER-PKG
    :parameters
    (
      ?obj - obj
      ?dst - location
    )
    :precondition
    (
    )
    :effect
    ( and
      ( obj-at ?obj ?dst )
    )
  )

)
