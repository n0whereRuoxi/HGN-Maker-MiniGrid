( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b372 - block
    b649 - block
    b721 - block
    b79 - block
    b285 - block
    b530 - block
    b483 - block
    b170 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b372 )
    ( on b649 b372 )
    ( on b721 b649 )
    ( on b79 b721 )
    ( on b285 b79 )
    ( on b530 b285 )
    ( on b483 b530 )
    ( on b170 b483 )
    ( clear b170 )
  )
  ( :goal
    ( and
      ( clear b372 )
    )
  )
)
