( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b54 - block
    b213 - block
    b858 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b54 )
    ( on b213 b54 )
    ( on b858 b213 )
    ( clear b858 )
  )
  ( :goal
    ( and
      ( clear b54 )
    )
  )
)
