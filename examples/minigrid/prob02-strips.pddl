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
    k000 - obj
    p000 - obj
  )

  ( :init
    ( robot-in r000 c000 )
    ( obj-in k000 c001 )
    ( obj-in p000 c002 )
    ( door-on d000 c000 )
    ( door-on d000 c001 )
    ( door-on d001 c000 )
    ( door-on d001 c002 )
    ( locked d001 )
    ( open d000 )
    ( key k000 )
  )

  ( :goal
    ( and
      ( obj-in p000 c000 )
    )
  )
)

