( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b580 - block
    b942 - block
    b453 - block
    b677 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b580 )
    ( on b942 b580 )
    ( on b453 b942 )
    ( on b677 b453 )
    ( clear b677 )
  )
  ( :goal
    ( and
      ( clear b580 )
    )
  )
)
