( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b88 - block
    b364 - block
    b790 - block
    b466 - block
    b276 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b88 )
    ( on b364 b88 )
    ( on b790 b364 )
    ( on b466 b790 )
    ( on b276 b466 )
    ( clear b276 )
  )
  ( :goal
    ( and
      ( clear b88 )
    )
  )
)
