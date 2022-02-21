( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b580 - block
    b84 - block
    b742 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b580 )
    ( on b84 b580 )
    ( on b742 b84 )
    ( clear b742 )
  )
  ( :goal
    ( and
      ( clear b580 )
      ( clear b580 )
      ( clear b580 )
    )
  )
)
