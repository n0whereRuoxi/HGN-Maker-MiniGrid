( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b962 - block
    b261 - block
    b557 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b962 )
    ( on b261 b962 )
    ( on b557 b261 )
    ( clear b557 )
  )
  ( :goal
    ( and
      ( clear b962 )
    )
  )
)
