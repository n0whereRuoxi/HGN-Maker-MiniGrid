( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b982 - block
    b622 - block
    b698 - block
    b104 - block
    b906 - block
    b390 - block
    b450 - block
    b523 - block
    b365 - block
    b442 - block
    b2 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b982 )
    ( on b622 b982 )
    ( on b698 b622 )
    ( on b104 b698 )
    ( on b906 b104 )
    ( on b390 b906 )
    ( on b450 b390 )
    ( on b523 b450 )
    ( on b365 b523 )
    ( on b442 b365 )
    ( on b2 b442 )
    ( clear b2 )
  )
  ( :goal
    ( and
      ( clear b982 )
    )
  )
)
