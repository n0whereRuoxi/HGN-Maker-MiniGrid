( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b54 - block
    b383 - block
    b391 - block
    b395 - block
    b529 - block
    b448 - block
    b84 - block
    b477 - block
    b112 - block
    b415 - block
    b55 - block
    b646 - block
    b450 - block
    b233 - block
    b124 - block
    b540 - block
    b677 - block
    b166 - block
    b901 - block
    b941 - block
    b435 - block
    b648 - block
    b18 - block
    b367 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b54 )
    ( on b383 b54 )
    ( on b391 b383 )
    ( on b395 b391 )
    ( on b529 b395 )
    ( on b448 b529 )
    ( on b84 b448 )
    ( on b477 b84 )
    ( on b112 b477 )
    ( on b415 b112 )
    ( on b55 b415 )
    ( on b646 b55 )
    ( on b450 b646 )
    ( on b233 b450 )
    ( on b124 b233 )
    ( on b540 b124 )
    ( on b677 b540 )
    ( on b166 b677 )
    ( on b901 b166 )
    ( on b941 b901 )
    ( on b435 b941 )
    ( on b648 b435 )
    ( on b18 b648 )
    ( on b367 b18 )
    ( clear b367 )
  )
  ( :goal
    ( and
      ( clear b54 )
    )
  )
)
