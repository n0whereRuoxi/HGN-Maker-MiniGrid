( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b922 - block
    b609 - block
    b700 - block
    b824 - block
    b960 - block
    b400 - block
    b102 - block
    b452 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b922 )
    ( on b609 b922 )
    ( on b700 b609 )
    ( on b824 b700 )
    ( on b960 b824 )
    ( on b400 b960 )
    ( on b102 b400 )
    ( on b452 b102 )
    ( clear b452 )
  )
  ( :goal
    ( and
      ( clear b922 )
    )
  )
)
