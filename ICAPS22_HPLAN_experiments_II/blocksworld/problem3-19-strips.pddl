( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b62 - block
    b486 - block
    b234 - block
    b617 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b62 )
    ( on b486 b62 )
    ( on b234 b486 )
    ( on b617 b234 )
    ( clear b617 )
  )
  ( :goal
    ( and
      ( clear b62 )
    )
  )
)
