( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b698 - block
    b286 - block
    b580 - block
    b425 - block
    b622 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b698 )
    ( on b286 b698 )
    ( on b580 b286 )
    ( on b425 b580 )
    ( on b622 b425 )
    ( clear b622 )
  )
  ( :goal
    ( and
      ( clear b698 )
    )
  )
)
