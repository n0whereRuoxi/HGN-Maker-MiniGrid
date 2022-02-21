( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b975 - block
    b778 - block
    b168 - block
    b41 - block
    b368 - block
    b34 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b975 )
    ( on b778 b975 )
    ( on b168 b778 )
    ( on b41 b168 )
    ( on b368 b41 )
    ( on b34 b368 )
    ( clear b34 )
  )
  ( :goal
    ( and
      ( clear b975 )
      ( clear b975 )
      ( clear b975 )
      ( clear b975 )
      ( clear b975 )
      ( clear b975 )
    )
  )
)
