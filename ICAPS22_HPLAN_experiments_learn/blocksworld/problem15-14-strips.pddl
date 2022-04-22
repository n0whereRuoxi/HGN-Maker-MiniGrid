( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b610 - block
    b664 - block
    b778 - block
    b464 - block
    b996 - block
    b526 - block
    b461 - block
    b626 - block
    b408 - block
    b241 - block
    b797 - block
    b407 - block
    b625 - block
    b947 - block
    b206 - block
    b512 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b610 )
    ( on b664 b610 )
    ( on b778 b664 )
    ( on b464 b778 )
    ( on b996 b464 )
    ( on b526 b996 )
    ( on b461 b526 )
    ( on b626 b461 )
    ( on b408 b626 )
    ( on b241 b408 )
    ( on b797 b241 )
    ( on b407 b797 )
    ( on b625 b407 )
    ( on b947 b625 )
    ( on b206 b947 )
    ( on b512 b206 )
    ( clear b512 )
  )
  ( :goal
    ( and
      ( clear b610 )
    )
  )
)
