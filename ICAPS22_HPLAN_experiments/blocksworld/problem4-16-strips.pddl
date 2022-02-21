( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b372 - block
    b510 - block
    b937 - block
    b240 - block
    b320 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b372 )
    ( on b510 b372 )
    ( on b937 b510 )
    ( on b240 b937 )
    ( on b320 b240 )
    ( clear b320 )
  )
  ( :goal
    ( and
      ( clear b372 )
    )
  )
)
