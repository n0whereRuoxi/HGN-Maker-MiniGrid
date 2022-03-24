( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b92 - block
    b423 - block
    b283 - block
    b499 - block
    b127 - block
    b442 - block
    b298 - block
    b42 - block
    b252 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b92 )
    ( on b423 b92 )
    ( on b283 b423 )
    ( on b499 b283 )
    ( on b127 b499 )
    ( on b442 b127 )
    ( on b298 b442 )
    ( on b42 b298 )
    ( on b252 b42 )
    ( clear b252 )
  )
  ( :tasks
    ( Make-8Pile b423 b283 b499 b127 b442 b298 b42 b252 )
  )
)
