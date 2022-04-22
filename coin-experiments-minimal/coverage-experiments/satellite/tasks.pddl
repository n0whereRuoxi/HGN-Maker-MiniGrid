( define 
  ( tasks satellite-tasks )

  ( :task GET_IMAGE
    :parameters
    (
      ?dir - direction
      ?mode - mode
    )
    :precondition
    (
    )
    :effect
    ( and
      ( have_image ?dir ?mode )
    )
  )

)
