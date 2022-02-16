( define 
  ( tasks logistics-tasks )

  ( :task Load-Pkg
    :parameters
    (
      ?t - truck
      ?obj1 - obj
    )
    :precondition
    (
    )
    :effect
    ( and
      ( in-truck ?obj1 ?t )
    )
  )


  ( :task Load-2Pkg
    :parameters
    (
      ?t - truck
      ?obj1 - obj
      ?obj2 - obj
    )
    :precondition
    (
    )
    :effect
    ( and
      ( in-truck ?obj1 ?t )
      ( in-truck ?obj2 ?t )
    )
  )



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
