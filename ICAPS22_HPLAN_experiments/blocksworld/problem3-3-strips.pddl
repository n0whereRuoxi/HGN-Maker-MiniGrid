( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b367 - block
    b41 - block
    b259 - block
    b657 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b367 )
    ( on b41 b367 )
    ( on b259 b41 )
    ( on b657 b259 )
    ( clear b657 )
  )
  ( :goal
    ( and
      ( clear b367 )
    )
  )
)
