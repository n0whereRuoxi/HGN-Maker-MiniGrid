( define
  ( tasks logistics-tasks )
  ( :task Deliver-3Pkg
    :parameters
    (
      ?obj1 - obj
      ?obj2 - obj
      ?obj3 - obj
      ?dst - location
    )
    :precondition
    (
    )
    :effect
    ( and
      ( obj-at ?obj1 ?dst )
      ( obj-at ?obj2 ?dst )
      ( obj-at ?obj3 ?dst )
    )
  )
)
