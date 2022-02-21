( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b868 - block
    b52 - block
    b474 - block
    b322 - block
    b134 - block
    b554 - block
    b494 - block
    b622 - block
    b901 - block
    b581 - block
    b255 - block
    b136 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b868 )
    ( on b52 b868 )
    ( on b474 b52 )
    ( on b322 b474 )
    ( on b134 b322 )
    ( on b554 b134 )
    ( on b494 b554 )
    ( on b622 b494 )
    ( on b901 b622 )
    ( on b581 b901 )
    ( on b255 b581 )
    ( on b136 b255 )
    ( clear b136 )
  )
  ( :goal
    ( and
      ( clear b868 )
    )
  )
)
