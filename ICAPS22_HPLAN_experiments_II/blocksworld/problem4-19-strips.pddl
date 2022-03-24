( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b878 - block
    b233 - block
    b21 - block
    b329 - block
    b412 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b878 )
    ( on b233 b878 )
    ( on b21 b233 )
    ( on b329 b21 )
    ( on b412 b329 )
    ( clear b412 )
  )
  ( :goal
    ( and
      ( clear b878 )
    )
  )
)
