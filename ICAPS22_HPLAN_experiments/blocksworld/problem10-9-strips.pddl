( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b442 - block
    b734 - block
    b687 - block
    b129 - block
    b651 - block
    b456 - block
    b578 - block
    b297 - block
    b452 - block
    b386 - block
    b49 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b442 )
    ( on b734 b442 )
    ( on b687 b734 )
    ( on b129 b687 )
    ( on b651 b129 )
    ( on b456 b651 )
    ( on b578 b456 )
    ( on b297 b578 )
    ( on b452 b297 )
    ( on b386 b452 )
    ( on b49 b386 )
    ( clear b49 )
  )
  ( :goal
    ( and
      ( clear b442 )
    )
  )
)
