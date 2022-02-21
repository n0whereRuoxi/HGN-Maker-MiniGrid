( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b977 - block
    b423 - block
    b94 - block
    b135 - block
    b41 - block
    b441 - block
    b72 - block
    b540 - block
    b962 - block
    b464 - block
    b836 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b977 )
    ( on b423 b977 )
    ( on b94 b423 )
    ( on b135 b94 )
    ( on b41 b135 )
    ( on b441 b41 )
    ( on b72 b441 )
    ( on b540 b72 )
    ( on b962 b540 )
    ( on b464 b962 )
    ( on b836 b464 )
    ( clear b836 )
  )
  ( :goal
    ( and
      ( clear b977 )
    )
  )
)
