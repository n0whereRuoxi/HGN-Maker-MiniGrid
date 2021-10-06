( define 
  ( tasks minigrid-tasks )

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
