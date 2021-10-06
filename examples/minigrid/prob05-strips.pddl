( define ( problem probname )

  ( :domain minigrid )

  ( :requirements :strips :typing :equality )

  ( :objects
    r000 - robot
    c000 - room
    c001 - room
    c002 - room
    d000 - door
    d001 - door
  )

  ( :init
    ( robot-in r000 c001 )
    ( door-on d000 c000 )
    ( door-on d000 c001 )
    ( door-on d001 c001 )
    ( door-on d001 c002 )
    ( open d000 )
    ( open d001 )
  )

  ( :goal
    ( and
      ( robot-in r000 c002 )
    )
  )
)

