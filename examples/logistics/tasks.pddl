( define 
  ( tasks logistics-tasks )

  ( :task Deliver-2Pkg
    :parameters
    (
      ?obj1 - obj
      ?obj2 - obj
      ?dst - location
    )
    :precondition
    (
    )
    :effect
    ( and
      ( obj-at ?obj1 ?dst )
      ( obj-at ?obj2 ?dst )
    )
  )


  ( :task Deliver-Pkg
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
