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

  ( :task Open_Door
    :parameters
    (
      ?door - door
    )
    :precondition
    (
    )
    :effect
    ( and
      ( open ?door )
    )
  )


  ( :task Move-To
    :parameters
    (
      ?robot - robot
      ?room - room
    )
    :precondition
    (
    )
    :effect
    ( and
      ( robot-in ?robot ?room )
    )
  )
)
