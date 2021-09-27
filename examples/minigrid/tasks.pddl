( define 
  ( tasks minigrid-tasks )

  ( :task Deliver-Pkg
    :parameters
    (
      ?p - obj
      ?r - room
    )
    :precondition
    ( and
      ( is-package ?p )
    )
    :effect
    ( and
      ( obj-in ?p ?r )
    )
  )

)
