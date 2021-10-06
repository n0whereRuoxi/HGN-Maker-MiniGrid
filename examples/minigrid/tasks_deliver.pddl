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

)
