( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b554 - block
    b286 - block
    b817 - block
    b368 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b554 )
    ( on b286 b554 )
    ( on b817 b286 )
    ( on b368 b817 )
    ( clear b368 )
  )
  ( :goal
    ( and
      ( clear b554 )
    )
  )
)
