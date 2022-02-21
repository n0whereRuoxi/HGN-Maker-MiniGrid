( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b1 - block
    b238 - block
    b140 - block
    b260 - block
    b120 - block
    b364 - block
    b209 - block
    b518 - block
    b16 - block
    b188 - block
    b780 - block
    b286 - block
    b303 - block
    b738 - block
    b446 - block
    b821 - block
    b156 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b1 )
    ( on b238 b1 )
    ( on b140 b238 )
    ( on b260 b140 )
    ( on b120 b260 )
    ( on b364 b120 )
    ( on b209 b364 )
    ( on b518 b209 )
    ( on b16 b518 )
    ( on b188 b16 )
    ( on b780 b188 )
    ( on b286 b780 )
    ( on b303 b286 )
    ( on b738 b303 )
    ( on b446 b738 )
    ( on b821 b446 )
    ( on b156 b821 )
    ( clear b156 )
  )
  ( :goal
    ( and
      ( clear b1 )
    )
  )
)
