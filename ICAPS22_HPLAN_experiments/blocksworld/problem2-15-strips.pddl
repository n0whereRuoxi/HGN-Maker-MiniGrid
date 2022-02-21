( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b126 - block
    b381 - block
    b152 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b126 )
    ( on b381 b126 )
    ( on b152 b381 )
    ( clear b152 )
  )
  ( :goal
    ( and
      ( clear b126 )
    )
  )
)
