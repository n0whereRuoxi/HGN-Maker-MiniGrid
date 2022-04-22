( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b574 - block
    b238 - block
    b30 - block
    b110 - block
    b693 - block
    b329 - block
    b570 - block
    b423 - block
    b790 - block
    b497 - block
    b488 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b574 )
    ( on b238 b574 )
    ( on b30 b238 )
    ( on b110 b30 )
    ( on b693 b110 )
    ( on b329 b693 )
    ( on b570 b329 )
    ( on b423 b570 )
    ( on b790 b423 )
    ( on b497 b790 )
    ( on b488 b497 )
    ( clear b488 )
  )
  ( :goal
    ( and
      ( clear b574 )
    )
  )
)
