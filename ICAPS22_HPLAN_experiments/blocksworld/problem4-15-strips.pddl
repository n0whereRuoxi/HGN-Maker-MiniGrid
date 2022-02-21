( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b308 - block
    b489 - block
    b383 - block
    b465 - block
    b71 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b308 )
    ( on b489 b308 )
    ( on b383 b489 )
    ( on b465 b383 )
    ( on b71 b465 )
    ( clear b71 )
  )
  ( :goal
    ( and
      ( clear b308 )
    )
  )
)
