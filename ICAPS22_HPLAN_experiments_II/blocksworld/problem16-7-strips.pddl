( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b362 - block
    b678 - block
    b464 - block
    b734 - block
    b43 - block
    b953 - block
    b987 - block
    b547 - block
    b996 - block
    b558 - block
    b977 - block
    b970 - block
    b316 - block
    b531 - block
    b30 - block
    b394 - block
    b223 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b362 )
    ( on b678 b362 )
    ( on b464 b678 )
    ( on b734 b464 )
    ( on b43 b734 )
    ( on b953 b43 )
    ( on b987 b953 )
    ( on b547 b987 )
    ( on b996 b547 )
    ( on b558 b996 )
    ( on b977 b558 )
    ( on b970 b977 )
    ( on b316 b970 )
    ( on b531 b316 )
    ( on b30 b531 )
    ( on b394 b30 )
    ( on b223 b394 )
    ( clear b223 )
  )
  ( :goal
    ( and
      ( clear b362 )
    )
  )
)
