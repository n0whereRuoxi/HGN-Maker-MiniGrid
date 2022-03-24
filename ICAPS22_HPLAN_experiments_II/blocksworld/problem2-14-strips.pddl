( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b96 - block
    b563 - block
    b540 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b96 )
    ( on b563 b96 )
    ( on b540 b563 )
    ( clear b540 )
  )
  ( :goal
    ( and
      ( clear b96 )
    )
  )
)
