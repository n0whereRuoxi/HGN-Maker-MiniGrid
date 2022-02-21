( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b217 - block
    b509 - block
    b126 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b217 )
    ( on b509 b217 )
    ( on b126 b509 )
    ( clear b126 )
  )
  ( :goal
    ( and
      ( clear b217 )
    )
  )
)
