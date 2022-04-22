( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b12 - block
    b659 - block
    b348 - block
    b978 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b12 )
    ( on b659 b12 )
    ( on b348 b659 )
    ( on b978 b348 )
    ( clear b978 )
  )
  ( :goal
    ( and
      ( clear b12 )
    )
  )
)
