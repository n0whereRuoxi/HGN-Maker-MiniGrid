( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b525 - block
    b765 - block
    b591 - block
    b672 - block
    b13 - block
    b603 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b525 )
    ( on b765 b525 )
    ( on b591 b765 )
    ( on b672 b591 )
    ( on b13 b672 )
    ( on b603 b13 )
    ( clear b603 )
  )
  ( :tasks
    ( Make-5Pile b765 b591 b672 b13 b603 )
  )
)
