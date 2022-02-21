( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b731 - block
    b111 - block
    b746 - block
    b280 - block
    b188 - block
    b94 - block
    b652 - block
    b909 - block
    b180 - block
    b471 - block
    b361 - block
    b95 - block
    b76 - block
    b284 - block
    b218 - block
    b778 - block
    b803 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b731 )
    ( on b111 b731 )
    ( on b746 b111 )
    ( on b280 b746 )
    ( on b188 b280 )
    ( on b94 b188 )
    ( on b652 b94 )
    ( on b909 b652 )
    ( on b180 b909 )
    ( on b471 b180 )
    ( on b361 b471 )
    ( on b95 b361 )
    ( on b76 b95 )
    ( on b284 b76 )
    ( on b218 b284 )
    ( on b778 b218 )
    ( on b803 b778 )
    ( clear b803 )
  )
  ( :goal
    ( and
      ( clear b731 )
    )
  )
)
