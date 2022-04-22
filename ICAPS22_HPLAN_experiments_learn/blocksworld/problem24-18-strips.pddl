( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b687 - block
    b20 - block
    b235 - block
    b386 - block
    b500 - block
    b90 - block
    b377 - block
    b537 - block
    b417 - block
    b337 - block
    b580 - block
    b404 - block
    b602 - block
    b10 - block
    b216 - block
    b555 - block
    b424 - block
    b736 - block
    b857 - block
    b556 - block
    b699 - block
    b592 - block
    b923 - block
    b408 - block
    b329 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b687 )
    ( on b20 b687 )
    ( on b235 b20 )
    ( on b386 b235 )
    ( on b500 b386 )
    ( on b90 b500 )
    ( on b377 b90 )
    ( on b537 b377 )
    ( on b417 b537 )
    ( on b337 b417 )
    ( on b580 b337 )
    ( on b404 b580 )
    ( on b602 b404 )
    ( on b10 b602 )
    ( on b216 b10 )
    ( on b555 b216 )
    ( on b424 b555 )
    ( on b736 b424 )
    ( on b857 b736 )
    ( on b556 b857 )
    ( on b699 b556 )
    ( on b592 b699 )
    ( on b923 b592 )
    ( on b408 b923 )
    ( on b329 b408 )
    ( clear b329 )
  )
  ( :goal
    ( and
      ( clear b687 )
    )
  )
)
