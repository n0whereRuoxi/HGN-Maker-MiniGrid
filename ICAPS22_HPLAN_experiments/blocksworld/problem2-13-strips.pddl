( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b909 - block
    b59 - block
    b278 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b909 )
    ( on b59 b909 )
    ( on b278 b59 )
    ( clear b278 )
  )
  ( :goal
    ( and
      ( clear b909 )
    )
  )
)
