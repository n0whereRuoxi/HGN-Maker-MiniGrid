( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b948 - block
    b43 - block
    b241 - block
    b450 - block
    b305 - block
    b937 - block
    b350 - block
    b984 - block
    b22 - block
    b146 - block
    b515 - block
    b506 - block
    b290 - block
    b84 - block
    b790 - block
    b137 - block
    b17 - block
    b684 - block
    b285 - block
    b366 - block
    b291 - block
    b919 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b948 )
    ( on b43 b948 )
    ( on b241 b43 )
    ( on b450 b241 )
    ( on b305 b450 )
    ( on b937 b305 )
    ( on b350 b937 )
    ( on b984 b350 )
    ( on b22 b984 )
    ( on b146 b22 )
    ( on b515 b146 )
    ( on b506 b515 )
    ( on b290 b506 )
    ( on b84 b290 )
    ( on b790 b84 )
    ( on b137 b790 )
    ( on b17 b137 )
    ( on b684 b17 )
    ( on b285 b684 )
    ( on b366 b285 )
    ( on b291 b366 )
    ( on b919 b291 )
    ( clear b919 )
  )
  ( :goal
    ( and
      ( clear b948 )
    )
  )
)
