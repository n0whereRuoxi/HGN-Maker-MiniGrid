( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b49 - block
    b409 - block
    b754 - block
    b240 - block
    b964 - block
    b189 - block
    b899 - block
    b94 - block
    b812 - block
    b352 - block
    b371 - block
    b217 - block
    b513 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b49 )
    ( on b409 b49 )
    ( on b754 b409 )
    ( on b240 b754 )
    ( on b964 b240 )
    ( on b189 b964 )
    ( on b899 b189 )
    ( on b94 b899 )
    ( on b812 b94 )
    ( on b352 b812 )
    ( on b371 b352 )
    ( on b217 b371 )
    ( on b513 b217 )
    ( clear b513 )
  )
  ( :goal
    ( and
      ( clear b49 )
    )
  )
)
