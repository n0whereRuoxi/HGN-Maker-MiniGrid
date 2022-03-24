( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b500 - block
    b53 - block
    b345 - block
    b850 - block
    b456 - block
    b269 - block
    b429 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b500 )
    ( on b53 b500 )
    ( on b345 b53 )
    ( on b850 b345 )
    ( on b456 b850 )
    ( on b269 b456 )
    ( on b429 b269 )
    ( clear b429 )
  )
  ( :tasks
    ( Make-6Pile b53 b345 b850 b456 b269 b429 )
  )
)
