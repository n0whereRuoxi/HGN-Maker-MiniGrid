( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b765 - block
    b389 - block
    b718 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b765 )
    ( on b389 b765 )
    ( on b718 b389 )
    ( clear b718 )
  )
  ( :goal
    ( and
      ( clear b765 )
    )
  )
)
