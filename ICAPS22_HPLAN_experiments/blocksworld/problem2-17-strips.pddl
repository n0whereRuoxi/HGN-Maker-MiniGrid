( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b238 - block
    b694 - block
    b292 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b238 )
    ( on b694 b238 )
    ( on b292 b694 )
    ( clear b292 )
  )
  ( :goal
    ( and
      ( clear b238 )
    )
  )
)
