( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b480 - block
    b222 - block
    b89 - block
    b505 - block
    b427 - block
    b224 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b480 )
    ( on b222 b480 )
    ( on b89 b222 )
    ( on b505 b89 )
    ( on b427 b505 )
    ( on b224 b427 )
    ( clear b224 )
  )
  ( :goal
    ( and
      ( clear b480 )
    )
  )
)
