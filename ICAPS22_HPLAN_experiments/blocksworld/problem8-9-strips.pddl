( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b71 - block
    b445 - block
    b801 - block
    b115 - block
    b60 - block
    b189 - block
    b906 - block
    b444 - block
    b404 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b71 )
    ( on b445 b71 )
    ( on b801 b445 )
    ( on b115 b801 )
    ( on b60 b115 )
    ( on b189 b60 )
    ( on b906 b189 )
    ( on b444 b906 )
    ( on b404 b444 )
    ( clear b404 )
  )
  ( :goal
    ( and
      ( clear b71 )
    )
  )
)
