( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b242 - block
    b924 - block
    b269 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b242 )
    ( on b924 b242 )
    ( on b269 b924 )
    ( clear b269 )
  )
  ( :goal
    ( and
      ( clear b242 )
    )
  )
)
