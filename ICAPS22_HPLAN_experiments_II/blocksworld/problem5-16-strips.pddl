( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b438 - block
    b996 - block
    b97 - block
    b38 - block
    b374 - block
    b595 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b438 )
    ( on b996 b438 )
    ( on b97 b996 )
    ( on b38 b97 )
    ( on b374 b38 )
    ( on b595 b374 )
    ( clear b595 )
  )
  ( :goal
    ( and
      ( clear b438 )
    )
  )
)
