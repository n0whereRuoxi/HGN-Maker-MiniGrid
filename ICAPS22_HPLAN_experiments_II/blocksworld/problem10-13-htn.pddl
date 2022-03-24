( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b352 - block
    b344 - block
    b599 - block
    b942 - block
    b256 - block
    b3 - block
    b261 - block
    b621 - block
    b165 - block
    b327 - block
    b803 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b352 )
    ( on b344 b352 )
    ( on b599 b344 )
    ( on b942 b599 )
    ( on b256 b942 )
    ( on b3 b256 )
    ( on b261 b3 )
    ( on b621 b261 )
    ( on b165 b621 )
    ( on b327 b165 )
    ( on b803 b327 )
    ( clear b803 )
  )
  ( :tasks
    ( Make-10Pile b344 b599 b942 b256 b3 b261 b621 b165 b327 b803 )
  )
)
