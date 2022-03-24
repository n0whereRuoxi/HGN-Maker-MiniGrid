( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b164 - block
    b52 - block
    b2 - block
    b681 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b164 )
    ( on b52 b164 )
    ( on b2 b52 )
    ( on b681 b2 )
    ( clear b681 )
  )
  ( :goal
    ( and
      ( clear b164 )
    )
  )
)
