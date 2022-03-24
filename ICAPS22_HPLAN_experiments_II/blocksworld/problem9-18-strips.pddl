( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b825 - block
    b361 - block
    b278 - block
    b797 - block
    b900 - block
    b984 - block
    b429 - block
    b479 - block
    b483 - block
    b269 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b825 )
    ( on b361 b825 )
    ( on b278 b361 )
    ( on b797 b278 )
    ( on b900 b797 )
    ( on b984 b900 )
    ( on b429 b984 )
    ( on b479 b429 )
    ( on b483 b479 )
    ( on b269 b483 )
    ( clear b269 )
  )
  ( :goal
    ( and
      ( clear b825 )
    )
  )
)
