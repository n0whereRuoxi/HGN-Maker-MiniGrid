( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b18 - block
    b952 - block
    b381 - block
    b368 - block
    b234 - block
    b30 - block
    b12 - block
    b57 - block
    b263 - block
    b642 - block
    b450 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b18 )
    ( on b952 b18 )
    ( on b381 b952 )
    ( on b368 b381 )
    ( on b234 b368 )
    ( on b30 b234 )
    ( on b12 b30 )
    ( on b57 b12 )
    ( on b263 b57 )
    ( on b642 b263 )
    ( on b450 b642 )
    ( clear b450 )
  )
  ( :goal
    ( and
      ( clear b18 )
    )
  )
)
