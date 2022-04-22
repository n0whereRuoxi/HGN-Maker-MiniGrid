( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b339 - block
    b481 - block
    b30 - block
    b337 - block
    b852 - block
    b208 - block
    b840 - block
    b989 - block
    b406 - block
    b101 - block
    b396 - block
    b305 - block
    b58 - block
    b312 - block
    b272 - block
    b288 - block
    b738 - block
    b400 - block
    b245 - block
    b608 - block
    b715 - block
    b418 - block
    b895 - block
    b116 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b339 )
    ( on b481 b339 )
    ( on b30 b481 )
    ( on b337 b30 )
    ( on b852 b337 )
    ( on b208 b852 )
    ( on b840 b208 )
    ( on b989 b840 )
    ( on b406 b989 )
    ( on b101 b406 )
    ( on b396 b101 )
    ( on b305 b396 )
    ( on b58 b305 )
    ( on b312 b58 )
    ( on b272 b312 )
    ( on b288 b272 )
    ( on b738 b288 )
    ( on b400 b738 )
    ( on b245 b400 )
    ( on b608 b245 )
    ( on b715 b608 )
    ( on b418 b715 )
    ( on b895 b418 )
    ( on b116 b895 )
    ( clear b116 )
  )
  ( :goal
    ( and
      ( clear b339 )
    )
  )
)
