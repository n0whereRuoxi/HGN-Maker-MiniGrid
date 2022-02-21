( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b808 - block
    b513 - block
    b286 - block
    b370 - block
    b219 - block
    b367 - block
    b722 - block
    b831 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b808 )
    ( on b513 b808 )
    ( on b286 b513 )
    ( on b370 b286 )
    ( on b219 b370 )
    ( on b367 b219 )
    ( on b722 b367 )
    ( on b831 b722 )
    ( clear b831 )
  )
  ( :goal
    ( and
      ( clear b808 )
    )
  )
)
