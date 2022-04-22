( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b685 - block
    b525 - block
    b215 - block
    b211 - block
    b977 - block
    b530 - block
    b658 - block
    b329 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b685 )
    ( on b525 b685 )
    ( on b215 b525 )
    ( on b211 b215 )
    ( on b977 b211 )
    ( on b530 b977 )
    ( on b658 b530 )
    ( on b329 b658 )
    ( clear b329 )
  )
  ( :goal
    ( and
      ( clear b685 )
    )
  )
)
