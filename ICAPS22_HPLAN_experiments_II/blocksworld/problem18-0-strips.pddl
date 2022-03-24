( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b25 - block
    b595 - block
    b740 - block
    b168 - block
    b560 - block
    b306 - block
    b871 - block
    b701 - block
    b366 - block
    b397 - block
    b575 - block
    b352 - block
    b647 - block
    b895 - block
    b193 - block
    b900 - block
    b139 - block
    b342 - block
    b576 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b25 )
    ( on b595 b25 )
    ( on b740 b595 )
    ( on b168 b740 )
    ( on b560 b168 )
    ( on b306 b560 )
    ( on b871 b306 )
    ( on b701 b871 )
    ( on b366 b701 )
    ( on b397 b366 )
    ( on b575 b397 )
    ( on b352 b575 )
    ( on b647 b352 )
    ( on b895 b647 )
    ( on b193 b895 )
    ( on b900 b193 )
    ( on b139 b900 )
    ( on b342 b139 )
    ( on b576 b342 )
    ( clear b576 )
  )
  ( :goal
    ( and
      ( clear b25 )
    )
  )
)
