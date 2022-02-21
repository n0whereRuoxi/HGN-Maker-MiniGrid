( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b560 - block
    b23 - block
    b193 - block
    b666 - block
    b650 - block
    b965 - block
    b877 - block
    b972 - block
    b394 - block
    b642 - block
    b829 - block
    b550 - block
    b288 - block
    b349 - block
    b709 - block
    b283 - block
    b711 - block
    b982 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b560 )
    ( on b23 b560 )
    ( on b193 b23 )
    ( on b666 b193 )
    ( on b650 b666 )
    ( on b965 b650 )
    ( on b877 b965 )
    ( on b972 b877 )
    ( on b394 b972 )
    ( on b642 b394 )
    ( on b829 b642 )
    ( on b550 b829 )
    ( on b288 b550 )
    ( on b349 b288 )
    ( on b709 b349 )
    ( on b283 b709 )
    ( on b711 b283 )
    ( on b982 b711 )
    ( clear b982 )
  )
  ( :goal
    ( and
      ( clear b560 )
    )
  )
)
