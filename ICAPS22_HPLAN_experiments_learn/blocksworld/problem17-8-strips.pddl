( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b72 - block
    b318 - block
    b261 - block
    b683 - block
    b973 - block
    b998 - block
    b499 - block
    b27 - block
    b186 - block
    b525 - block
    b363 - block
    b617 - block
    b429 - block
    b482 - block
    b34 - block
    b64 - block
    b807 - block
    b411 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b72 )
    ( on b318 b72 )
    ( on b261 b318 )
    ( on b683 b261 )
    ( on b973 b683 )
    ( on b998 b973 )
    ( on b499 b998 )
    ( on b27 b499 )
    ( on b186 b27 )
    ( on b525 b186 )
    ( on b363 b525 )
    ( on b617 b363 )
    ( on b429 b617 )
    ( on b482 b429 )
    ( on b34 b482 )
    ( on b64 b34 )
    ( on b807 b64 )
    ( on b411 b807 )
    ( clear b411 )
  )
  ( :goal
    ( and
      ( clear b72 )
    )
  )
)
