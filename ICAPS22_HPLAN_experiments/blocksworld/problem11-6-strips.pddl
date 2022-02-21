( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b667 - block
    b547 - block
    b170 - block
    b9 - block
    b662 - block
    b678 - block
    b779 - block
    b608 - block
    b219 - block
    b456 - block
    b595 - block
    b598 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b667 )
    ( on b547 b667 )
    ( on b170 b547 )
    ( on b9 b170 )
    ( on b662 b9 )
    ( on b678 b662 )
    ( on b779 b678 )
    ( on b608 b779 )
    ( on b219 b608 )
    ( on b456 b219 )
    ( on b595 b456 )
    ( on b598 b595 )
    ( clear b598 )
  )
  ( :goal
    ( and
      ( clear b667 )
    )
  )
)
