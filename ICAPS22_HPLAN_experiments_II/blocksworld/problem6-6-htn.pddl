( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b983 - block
    b471 - block
    b420 - block
    b318 - block
    b958 - block
    b863 - block
    b125 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b983 )
    ( on b471 b983 )
    ( on b420 b471 )
    ( on b318 b420 )
    ( on b958 b318 )
    ( on b863 b958 )
    ( on b125 b863 )
    ( clear b125 )
  )
  ( :tasks
    ( Make-6Pile b471 b420 b318 b958 b863 b125 )
  )
)
