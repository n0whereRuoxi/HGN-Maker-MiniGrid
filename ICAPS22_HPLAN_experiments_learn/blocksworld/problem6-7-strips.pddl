( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b241 - block
    b363 - block
    b231 - block
    b524 - block
    b12 - block
    b210 - block
    b568 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b241 )
    ( on b363 b241 )
    ( on b231 b363 )
    ( on b524 b231 )
    ( on b12 b524 )
    ( on b210 b12 )
    ( on b568 b210 )
    ( clear b568 )
  )
  ( :goal
    ( and
      ( clear b241 )
    )
  )
)
