( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b453 - block
    b983 - block
    b998 - block
    b545 - block
    b811 - block
    b716 - block
    b784 - block
    b313 - block
    b259 - block
    b365 - block
    b280 - block
    b203 - block
    b326 - block
    b298 - block
    b123 - block
    b505 - block
    b904 - block
    b54 - block
    b742 - block
    b598 - block
    b136 - block
    b219 - block
    b153 - block
    b293 - block
    b156 - block
    b69 - block
    b8 - block
    b410 - block
    b764 - block
    b752 - block
    b375 - block
    b936 - block
    b623 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b453 )
    ( on b983 b453 )
    ( on b998 b983 )
    ( on b545 b998 )
    ( on b811 b545 )
    ( on b716 b811 )
    ( on b784 b716 )
    ( on b313 b784 )
    ( on b259 b313 )
    ( on b365 b259 )
    ( on b280 b365 )
    ( on b203 b280 )
    ( on b326 b203 )
    ( on b298 b326 )
    ( on b123 b298 )
    ( on b505 b123 )
    ( on b904 b505 )
    ( on b54 b904 )
    ( on b742 b54 )
    ( on b598 b742 )
    ( on b136 b598 )
    ( on b219 b136 )
    ( on b153 b219 )
    ( on b293 b153 )
    ( on b156 b293 )
    ( on b69 b156 )
    ( on b8 b69 )
    ( on b410 b8 )
    ( on b764 b410 )
    ( on b752 b764 )
    ( on b375 b752 )
    ( on b936 b375 )
    ( on b623 b936 )
    ( clear b623 )
  )
  ( :goal
    ( and
      ( clear b453 )
    )
  )
)
