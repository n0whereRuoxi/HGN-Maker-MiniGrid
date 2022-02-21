( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b28 - block
    b623 - block
    b998 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b28 )
    ( on b623 b28 )
    ( on b998 b623 )
    ( clear b998 )
  )
  ( :goal
    ( and
      ( clear b28 )
      ( clear b28 )
      ( clear b28 )
    )
  )
)
