( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b501 - block
    b332 - block
    b581 - block
    b362 - block
    b674 - block
    b655 - block
    b291 - block
    b976 - block
    b375 - block
    b632 - block
    b71 - block
    b833 - block
    b400 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b501 )
    ( on b332 b501 )
    ( on b581 b332 )
    ( on b362 b581 )
    ( on b674 b362 )
    ( on b655 b674 )
    ( on b291 b655 )
    ( on b976 b291 )
    ( on b375 b976 )
    ( on b632 b375 )
    ( on b71 b632 )
    ( on b833 b71 )
    ( on b400 b833 )
    ( clear b400 )
  )
  ( :goal
    ( and
      ( clear b501 )
    )
  )
)
