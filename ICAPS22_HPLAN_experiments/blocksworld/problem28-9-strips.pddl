( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b837 - block
    b414 - block
    b803 - block
    b540 - block
    b545 - block
    b903 - block
    b186 - block
    b815 - block
    b865 - block
    b236 - block
    b367 - block
    b5 - block
    b283 - block
    b108 - block
    b42 - block
    b53 - block
    b351 - block
    b206 - block
    b697 - block
    b643 - block
    b332 - block
    b829 - block
    b557 - block
    b851 - block
    b7 - block
    b455 - block
    b450 - block
    b593 - block
    b217 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b837 )
    ( on b414 b837 )
    ( on b803 b414 )
    ( on b540 b803 )
    ( on b545 b540 )
    ( on b903 b545 )
    ( on b186 b903 )
    ( on b815 b186 )
    ( on b865 b815 )
    ( on b236 b865 )
    ( on b367 b236 )
    ( on b5 b367 )
    ( on b283 b5 )
    ( on b108 b283 )
    ( on b42 b108 )
    ( on b53 b42 )
    ( on b351 b53 )
    ( on b206 b351 )
    ( on b697 b206 )
    ( on b643 b697 )
    ( on b332 b643 )
    ( on b829 b332 )
    ( on b557 b829 )
    ( on b851 b557 )
    ( on b7 b851 )
    ( on b455 b7 )
    ( on b450 b455 )
    ( on b593 b450 )
    ( on b217 b593 )
    ( clear b217 )
  )
  ( :goal
    ( and
      ( clear b837 )
    )
  )
)
