( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b474 - block
    b376 - block
    b931 - block
    b465 - block
    b266 - block
    b872 - block
    b520 - block
    b329 - block
    b272 - block
    b97 - block
    b227 - block
    b857 - block
    b288 - block
    b81 - block
    b511 - block
    b181 - block
    b74 - block
    b518 - block
    b362 - block
    b776 - block
    b411 - block
    b102 - block
    b668 - block
    b879 - block
    b599 - block
    b422 - block
    b151 - block
    b333 - block
    b304 - block
    b188 - block
    b506 - block
    b104 - block
    b448 - block
    b922 - block
    b6 - block
    b594 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b474 )
    ( on b376 b474 )
    ( on b931 b376 )
    ( on b465 b931 )
    ( on b266 b465 )
    ( on b872 b266 )
    ( on b520 b872 )
    ( on b329 b520 )
    ( on b272 b329 )
    ( on b97 b272 )
    ( on b227 b97 )
    ( on b857 b227 )
    ( on b288 b857 )
    ( on b81 b288 )
    ( on b511 b81 )
    ( on b181 b511 )
    ( on b74 b181 )
    ( on b518 b74 )
    ( on b362 b518 )
    ( on b776 b362 )
    ( on b411 b776 )
    ( on b102 b411 )
    ( on b668 b102 )
    ( on b879 b668 )
    ( on b599 b879 )
    ( on b422 b599 )
    ( on b151 b422 )
    ( on b333 b151 )
    ( on b304 b333 )
    ( on b188 b304 )
    ( on b506 b188 )
    ( on b104 b506 )
    ( on b448 b104 )
    ( on b922 b448 )
    ( on b6 b922 )
    ( on b594 b6 )
    ( clear b594 )
  )
  ( :goal
    ( and
      ( clear b474 )
    )
  )
)
