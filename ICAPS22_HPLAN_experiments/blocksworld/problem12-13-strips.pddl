( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b762 - block
    b114 - block
    b341 - block
    b53 - block
    b765 - block
    b754 - block
    b660 - block
    b942 - block
    b502 - block
    b490 - block
    b157 - block
    b142 - block
    b27 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b762 )
    ( on b114 b762 )
    ( on b341 b114 )
    ( on b53 b341 )
    ( on b765 b53 )
    ( on b754 b765 )
    ( on b660 b754 )
    ( on b942 b660 )
    ( on b502 b942 )
    ( on b490 b502 )
    ( on b157 b490 )
    ( on b142 b157 )
    ( on b27 b142 )
    ( clear b27 )
  )
  ( :goal
    ( and
      ( clear b762 )
    )
  )
)
