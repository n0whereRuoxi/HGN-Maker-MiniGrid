( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b189 - block
    b245 - block
    b654 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b189 )
    ( on b245 b189 )
    ( on b654 b245 )
    ( clear b654 )
  )
  ( :goal
    ( and
      ( clear b189 )
    )
  )
)
