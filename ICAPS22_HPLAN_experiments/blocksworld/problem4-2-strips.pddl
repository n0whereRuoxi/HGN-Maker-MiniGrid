( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b599 - block
    b870 - block
    b542 - block
    b464 - block
    b537 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b599 )
    ( on b870 b599 )
    ( on b542 b870 )
    ( on b464 b542 )
    ( on b537 b464 )
    ( clear b537 )
  )
  ( :goal
    ( and
      ( clear b599 )
    )
  )
)
