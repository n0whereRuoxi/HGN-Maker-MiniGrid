( define ( problem probname )

  ( :domain minigrid )

  ( :requirements :strips :typing :equality )

  ( :objects
    r000 - robot
    c000 - room
    c001 - room
    c002 - room
    c003 - room
    d000 - door
    d001 - door
    d002 - door
    k000 - obj
    p000 - obj
    p001 - obj
    p002 - obj
  )

  ( :init
    ( robot-in r000 c000 )
    ( obj-in k000 c001 )
    ( obj-in p000 c002 )
    ( obj-in p001 c001 )
    ( obj-in p002 c003 )
    ( door-on d000 c000 )
    ( door-on d000 c001 )
    ( door-on d001 c000 )
    ( door-on d001 c002 )
    ( door-on d002 c001 )
    ( door-on d002 c003 )
    ( open d000 )
    ( locked d001 )
    ( locked d002 )
    ( key k000 )
  )

  ( :goal
    ( and
      ( obj-in p000 c000 )
      ( obj-in p001 c000 )
      ( obj-in p002 c000 )
    )
  )
)

