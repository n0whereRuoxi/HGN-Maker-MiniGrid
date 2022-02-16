( define 
  ( tasks logistics-tasks )

  ( :task Deliver-2Pkg
    :parameters
    (
      ?obj1 - obj
      ?obj2 - obj
      ?dst1 - location
      ?dst2 - location
    )
    :precondition
    (
    )
    :effect
    ( and
      ( obj-at ?obj1 ?dst1 )
      ( obj-at ?obj2 ?dst2 )
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
