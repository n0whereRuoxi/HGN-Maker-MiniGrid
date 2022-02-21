( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b473 - block
    b734 - block
    b384 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b473 )
    ( on b734 b473 )
    ( on b384 b734 )
    ( clear b384 )
  )
  ( :goal
    ( and
      ( clear b473 )
    )
  )
)
