( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b349 - block
    b366 - block
    b486 - block
    b457 - block
    b340 - block
    b551 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b349 )
    ( on b366 b349 )
    ( on b486 b366 )
    ( on b457 b486 )
    ( on b340 b457 )
    ( on b551 b340 )
    ( clear b551 )
  )
  ( :goal
    ( and
      ( clear b349 )
      ( clear b349 )
      ( clear b349 )
      ( clear b349 )
      ( clear b349 )
      ( clear b349 )
    )
  )
)
