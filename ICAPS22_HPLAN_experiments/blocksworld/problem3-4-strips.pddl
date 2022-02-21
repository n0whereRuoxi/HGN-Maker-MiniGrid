( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b65 - block
    b186 - block
    b366 - block
    b156 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b65 )
    ( on b186 b65 )
    ( on b366 b186 )
    ( on b156 b366 )
    ( clear b156 )
  )
  ( :goal
    ( and
      ( clear b65 )
      ( clear b65 )
      ( clear b65 )
      ( clear b65 )
    )
  )
)
