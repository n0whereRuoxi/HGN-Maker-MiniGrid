( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b453 - block
    b607 - block
    b526 - block
    b148 - block
    b746 - block
    b390 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b453 )
    ( on b607 b453 )
    ( on b526 b607 )
    ( on b148 b526 )
    ( on b746 b148 )
    ( on b390 b746 )
    ( clear b390 )
  )
  ( :goal
    ( and
      ( clear b453 )
    )
  )
)
