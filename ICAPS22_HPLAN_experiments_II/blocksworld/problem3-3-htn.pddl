( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b804 - block
    b977 - block
    b597 - block
    b2 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b804 )
    ( on b977 b804 )
    ( on b597 b977 )
    ( on b2 b597 )
    ( clear b2 )
  )
  ( :tasks
    ( Make-3Pile b977 b597 b2 )
  )
)
