( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b894 - block
    b608 - block
    b238 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b894 )
    ( on b608 b894 )
    ( on b238 b608 )
    ( clear b238 )
  )
  ( :goal
    ( and
      ( clear b894 )
    )
  )
)
