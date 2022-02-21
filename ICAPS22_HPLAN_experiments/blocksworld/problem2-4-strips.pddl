( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b644 - block
    b370 - block
    b102 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b644 )
    ( on b370 b644 )
    ( on b102 b370 )
    ( clear b102 )
  )
  ( :goal
    ( and
      ( clear b644 )
      ( clear b644 )
      ( clear b644 )
    )
  )
)
