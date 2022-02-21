( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b756 - block
    b159 - block
    b502 - block
    b39 - block
    b615 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b756 )
    ( on b159 b756 )
    ( on b502 b159 )
    ( on b39 b502 )
    ( on b615 b39 )
    ( clear b615 )
  )
  ( :goal
    ( and
      ( clear b756 )
    )
  )
)
