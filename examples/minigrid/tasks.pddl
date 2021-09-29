( define 
  ( tasks minigrid-tasks )

  ( :task Deliver-Pkg
    :parameters
    (
      ?parcel - obj
      ?room - room
    )
    :precondition
    (
    )
    :effect
    ( and
      ( obj-in ?parcel ?room )
    )
  )

  ( :task Pick-Up-Obj
    :parameters
    (
      ?robot - robot
      ?obj - obj
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on-robot ?obj ?robot )
    )
  )

)
