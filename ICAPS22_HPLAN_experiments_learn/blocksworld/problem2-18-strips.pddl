( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b441 - block
    b626 - block
    b278 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b441 )
    ( on b626 b441 )
    ( on b278 b626 )
    ( clear b278 )
  )
  ( :goal
    ( and
      ( clear b441 )
    )
  )
)
