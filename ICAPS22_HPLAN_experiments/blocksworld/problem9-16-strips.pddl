( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b511 - block
    b347 - block
    b171 - block
    b368 - block
    b660 - block
    b54 - block
    b308 - block
    b965 - block
    b318 - block
    b467 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b511 )
    ( on b347 b511 )
    ( on b171 b347 )
    ( on b368 b171 )
    ( on b660 b368 )
    ( on b54 b660 )
    ( on b308 b54 )
    ( on b965 b308 )
    ( on b318 b965 )
    ( on b467 b318 )
    ( clear b467 )
  )
  ( :goal
    ( and
      ( clear b511 )
    )
  )
)
