( define
  ( tasks logistics-tasks )
  ( :task Deliver-1Pkg
    :parameters
    (
      ?obj1 - obj
      ?dst - location
    )
    :precondition
    (
    )
    :effect
    ( and
      ( obj-at ?obj1 ?dst )
    )
  )
)
