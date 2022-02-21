( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b904 - block
    b790 - block
    b545 - block
    b810 - block
    b123 - block
    b683 - block
    b393 - block
    b581 - block
    b115 - block
    b197 - block
    b884 - block
    b577 - block
    b49 - block
    b571 - block
    b910 - block
    b389 - block
    b216 - block
    b846 - block
    b400 - block
    b364 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b904 )
    ( on b790 b904 )
    ( on b545 b790 )
    ( on b810 b545 )
    ( on b123 b810 )
    ( on b683 b123 )
    ( on b393 b683 )
    ( on b581 b393 )
    ( on b115 b581 )
    ( on b197 b115 )
    ( on b884 b197 )
    ( on b577 b884 )
    ( on b49 b577 )
    ( on b571 b49 )
    ( on b910 b571 )
    ( on b389 b910 )
    ( on b216 b389 )
    ( on b846 b216 )
    ( on b400 b846 )
    ( on b364 b400 )
    ( clear b364 )
  )
  ( :goal
    ( and
      ( clear b904 )
    )
  )
)
