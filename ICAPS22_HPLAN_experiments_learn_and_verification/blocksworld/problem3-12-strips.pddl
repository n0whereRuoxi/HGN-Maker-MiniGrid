( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b97 - block
    b619 - block
    b102 - block
    b510 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b97 )
    ( on b619 b97 )
    ( on b102 b619 )
    ( on b510 b102 )
    ( clear b510 )
  )
  ( :goal
    ( and
      ( clear b97 )
    )
  )
)