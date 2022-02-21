( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b509 - block
    b575 - block
    b59 - block
    b450 - block
    b630 - block
    b448 - block
    b826 - block
    b483 - block
    b376 - block
    b246 - block
    b719 - block
    b950 - block
    b74 - block
    b106 - block
    b216 - block
    b602 - block
    b663 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b509 )
    ( on b575 b509 )
    ( on b59 b575 )
    ( on b450 b59 )
    ( on b630 b450 )
    ( on b448 b630 )
    ( on b826 b448 )
    ( on b483 b826 )
    ( on b376 b483 )
    ( on b246 b376 )
    ( on b719 b246 )
    ( on b950 b719 )
    ( on b74 b950 )
    ( on b106 b74 )
    ( on b216 b106 )
    ( on b602 b216 )
    ( on b663 b602 )
    ( clear b663 )
  )
  ( :goal
    ( and
      ( clear b509 )
    )
  )
)
