( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b572 - block
    b355 - block
    b333 - block
    b881 - block
    b481 - block
    b98 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b572 )
    ( on b355 b572 )
    ( on b333 b355 )
    ( on b881 b333 )
    ( on b481 b881 )
    ( on b98 b481 )
    ( clear b98 )
  )
  ( :tasks
    ( Make-5Pile b355 b333 b881 b481 b98 )
  )
)
