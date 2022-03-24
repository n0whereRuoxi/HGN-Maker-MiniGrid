( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b665 - block
    b560 - block
    b461 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b665 )
    ( on b560 b665 )
    ( on b461 b560 )
    ( clear b461 )
  )
  ( :goal
    ( and
      ( clear b665 )
    )
  )
)
