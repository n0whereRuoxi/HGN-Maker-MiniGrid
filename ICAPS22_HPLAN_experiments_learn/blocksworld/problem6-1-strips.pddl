( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b656 - block
    b688 - block
    b423 - block
    b370 - block
    b604 - block
    b891 - block
    b645 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b656 )
    ( on b688 b656 )
    ( on b423 b688 )
    ( on b370 b423 )
    ( on b604 b370 )
    ( on b891 b604 )
    ( on b645 b891 )
    ( clear b645 )
  )
  ( :goal
    ( and
      ( clear b656 )
    )
  )
)
