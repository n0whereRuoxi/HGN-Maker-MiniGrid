( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b622 - block
    b820 - block
    b54 - block
    b524 - block
    b888 - block
    b81 - block
    b472 - block
    b323 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b622 )
    ( on b820 b622 )
    ( on b54 b820 )
    ( on b524 b54 )
    ( on b888 b524 )
    ( on b81 b888 )
    ( on b472 b81 )
    ( on b323 b472 )
    ( clear b323 )
  )
  ( :goal
    ( and
      ( clear b622 )
    )
  )
)
