( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b716 - block
    b216 - block
    b342 - block
    b75 - block
    b621 - block
    b280 - block
    b726 - block
    b259 - block
    b871 - block
    b375 - block
    b294 - block
    b708 - block
    b828 - block
    b623 - block
    b853 - block
    b323 - block
    b527 - block
    b257 - block
    b435 - block
    b318 - block
    b558 - block
    b332 - block
    b56 - block
    b417 - block
    b313 - block
    b427 - block
    b921 - block
    b12 - block
    b998 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b716 )
    ( on b216 b716 )
    ( on b342 b216 )
    ( on b75 b342 )
    ( on b621 b75 )
    ( on b280 b621 )
    ( on b726 b280 )
    ( on b259 b726 )
    ( on b871 b259 )
    ( on b375 b871 )
    ( on b294 b375 )
    ( on b708 b294 )
    ( on b828 b708 )
    ( on b623 b828 )
    ( on b853 b623 )
    ( on b323 b853 )
    ( on b527 b323 )
    ( on b257 b527 )
    ( on b435 b257 )
    ( on b318 b435 )
    ( on b558 b318 )
    ( on b332 b558 )
    ( on b56 b332 )
    ( on b417 b56 )
    ( on b313 b417 )
    ( on b427 b313 )
    ( on b921 b427 )
    ( on b12 b921 )
    ( on b998 b12 )
    ( clear b998 )
  )
  ( :goal
    ( and
      ( clear b716 )
    )
  )
)
