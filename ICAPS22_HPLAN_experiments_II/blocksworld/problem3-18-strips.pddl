( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b453 - block
    b548 - block
    b36 - block
    b769 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b453 )
    ( on b548 b453 )
    ( on b36 b548 )
    ( on b769 b36 )
    ( clear b769 )
  )
  ( :goal
    ( and
      ( clear b453 )
    )
  )
)
