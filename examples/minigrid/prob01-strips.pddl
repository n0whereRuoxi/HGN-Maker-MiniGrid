( define ( problem probname )

  ( :domain minigrid )

  ( :requirements :strips :typing :equality )

  ( :objects
    r000 - robot
    c000 - room
    c001 - room
    d000 - door
    k000 - obj
    p000 - obj
  )

  ( :init
    ( robot-in r000 c000 )
    ( obj-in k000 c000 )
    ( obj-in p000 c001 )
    ( door-on d000 c000 )
    ( door-on d000 c001 )
    ( locked d000 )
    ( key k000 )
  )

  ( :goal
    ( and
      ( obj-in p000 c000 )
    )
  )
)

