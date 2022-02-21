( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b967 - block
    b669 - block
    b580 - block
    b282 - block
    b295 - block
    b522 - block
    b125 - block
    b529 - block
    b464 - block
    b560 - block
    b990 - block
    b508 - block
    b253 - block
    b703 - block
    b530 - block
    b591 - block
    b654 - block
    b444 - block
    b721 - block
    b848 - block
    b88 - block
    b542 - block
    b882 - block
    b386 - block
    b349 - block
    b56 - block
    b575 - block
    b250 - block
    b255 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b967 )
    ( on b669 b967 )
    ( on b580 b669 )
    ( on b282 b580 )
    ( on b295 b282 )
    ( on b522 b295 )
    ( on b125 b522 )
    ( on b529 b125 )
    ( on b464 b529 )
    ( on b560 b464 )
    ( on b990 b560 )
    ( on b508 b990 )
    ( on b253 b508 )
    ( on b703 b253 )
    ( on b530 b703 )
    ( on b591 b530 )
    ( on b654 b591 )
    ( on b444 b654 )
    ( on b721 b444 )
    ( on b848 b721 )
    ( on b88 b848 )
    ( on b542 b88 )
    ( on b882 b542 )
    ( on b386 b882 )
    ( on b349 b386 )
    ( on b56 b349 )
    ( on b575 b56 )
    ( on b250 b575 )
    ( on b255 b250 )
    ( clear b255 )
  )
  ( :goal
    ( and
      ( clear b967 )
    )
  )
)
