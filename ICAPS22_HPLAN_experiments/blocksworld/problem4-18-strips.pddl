( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b419 - block
    b56 - block
    b31 - block
    b826 - block
    b475 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b419 )
    ( on b56 b419 )
    ( on b31 b56 )
    ( on b826 b31 )
    ( on b475 b826 )
    ( clear b475 )
  )
  ( :goal
    ( and
      ( clear b419 )
      ( clear b419 )
      ( clear b419 )
      ( clear b419 )
      ( clear b419 )
    )
  )
)
