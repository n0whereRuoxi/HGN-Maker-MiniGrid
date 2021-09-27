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
    ( door-between d000 c000 c001 )
    ( locked d000 )
    ( is-key k000 )
    ( is-package p000 )
  )

  ( :goal
    ( and
      ( obj-at p000 c000 )
    )
  )
)

