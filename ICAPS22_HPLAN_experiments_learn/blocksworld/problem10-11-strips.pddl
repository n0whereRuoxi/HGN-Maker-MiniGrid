( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b141 - block
    b882 - block
    b562 - block
    b352 - block
    b474 - block
    b462 - block
    b545 - block
    b598 - block
    b619 - block
    b989 - block
    b571 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b141 )
    ( on b882 b141 )
    ( on b562 b882 )
    ( on b352 b562 )
    ( on b474 b352 )
    ( on b462 b474 )
    ( on b545 b462 )
    ( on b598 b545 )
    ( on b619 b598 )
    ( on b989 b619 )
    ( on b571 b989 )
    ( clear b571 )
  )
  ( :goal
    ( and
      ( clear b141 )
    )
  )
)
