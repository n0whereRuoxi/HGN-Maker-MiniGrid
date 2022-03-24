( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b519 - block
    b796 - block
    b510 - block
    b131 - block
    b340 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b519 )
    ( on b796 b519 )
    ( on b510 b796 )
    ( on b131 b510 )
    ( on b340 b131 )
    ( clear b340 )
  )
  ( :goal
    ( and
      ( clear b519 )
    )
  )
)
