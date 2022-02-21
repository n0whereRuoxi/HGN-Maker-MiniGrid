( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b630 - block
    b125 - block
    b534 - block
    b491 - block
    b11 - block
    b585 - block
    b734 - block
    b240 - block
    b962 - block
    b306 - block
    b363 - block
    b138 - block
    b169 - block
    b691 - block
    b479 - block
    b66 - block
    b937 - block
    b979 - block
    b241 - block
    b500 - block
    b498 - block
    b474 - block
    b328 - block
    b232 - block
    b811 - block
    b857 - block
    b621 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b630 )
    ( on b125 b630 )
    ( on b534 b125 )
    ( on b491 b534 )
    ( on b11 b491 )
    ( on b585 b11 )
    ( on b734 b585 )
    ( on b240 b734 )
    ( on b962 b240 )
    ( on b306 b962 )
    ( on b363 b306 )
    ( on b138 b363 )
    ( on b169 b138 )
    ( on b691 b169 )
    ( on b479 b691 )
    ( on b66 b479 )
    ( on b937 b66 )
    ( on b979 b937 )
    ( on b241 b979 )
    ( on b500 b241 )
    ( on b498 b500 )
    ( on b474 b498 )
    ( on b328 b474 )
    ( on b232 b328 )
    ( on b811 b232 )
    ( on b857 b811 )
    ( on b621 b857 )
    ( clear b621 )
  )
  ( :goal
    ( and
      ( clear b630 )
    )
  )
)
