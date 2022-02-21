( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b785 - block
    b78 - block
    b366 - block
    b21 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b785 )
    ( on b78 b785 )
    ( on b366 b78 )
    ( on b21 b366 )
    ( clear b21 )
  )
  ( :goal
    ( and
      ( clear b785 )
    )
  )
)
