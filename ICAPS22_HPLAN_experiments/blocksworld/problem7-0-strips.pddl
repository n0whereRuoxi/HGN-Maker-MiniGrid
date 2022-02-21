( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b544 - block
    b537 - block
    b429 - block
    b344 - block
    b664 - block
    b971 - block
    b84 - block
    b896 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b544 )
    ( on b537 b544 )
    ( on b429 b537 )
    ( on b344 b429 )
    ( on b664 b344 )
    ( on b971 b664 )
    ( on b84 b971 )
    ( on b896 b84 )
    ( clear b896 )
  )
  ( :goal
    ( and
      ( clear b544 )
    )
  )
)
