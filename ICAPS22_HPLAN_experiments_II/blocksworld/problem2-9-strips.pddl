( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b343 - block
    b765 - block
    b678 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b343 )
    ( on b765 b343 )
    ( on b678 b765 )
    ( clear b678 )
  )
  ( :goal
    ( and
      ( clear b343 )
    )
  )
)
