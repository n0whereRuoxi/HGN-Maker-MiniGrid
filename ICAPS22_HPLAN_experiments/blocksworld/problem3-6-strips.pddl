( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b514 - block
    b309 - block
    b146 - block
    b690 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b514 )
    ( on b309 b514 )
    ( on b146 b309 )
    ( on b690 b146 )
    ( clear b690 )
  )
  ( :goal
    ( and
      ( clear b514 )
    )
  )
)
