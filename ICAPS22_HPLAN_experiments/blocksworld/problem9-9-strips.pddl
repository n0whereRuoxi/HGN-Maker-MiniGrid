( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b565 - block
    b878 - block
    b453 - block
    b459 - block
    b54 - block
    b836 - block
    b200 - block
    b52 - block
    b297 - block
    b108 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b565 )
    ( on b878 b565 )
    ( on b453 b878 )
    ( on b459 b453 )
    ( on b54 b459 )
    ( on b836 b54 )
    ( on b200 b836 )
    ( on b52 b200 )
    ( on b297 b52 )
    ( on b108 b297 )
    ( clear b108 )
  )
  ( :goal
    ( and
      ( clear b565 )
    )
  )
)
