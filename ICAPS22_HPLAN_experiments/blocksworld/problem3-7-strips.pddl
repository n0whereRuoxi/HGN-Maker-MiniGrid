( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b287 - block
    b756 - block
    b516 - block
    b15 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b287 )
    ( on b756 b287 )
    ( on b516 b756 )
    ( on b15 b516 )
    ( clear b15 )
  )
  ( :goal
    ( and
      ( clear b287 )
    )
  )
)
