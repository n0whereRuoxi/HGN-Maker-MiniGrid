( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b174 - block
    b691 - block
    b609 - block
    b939 - block
    b289 - block
    b847 - block
    b989 - block
    b464 - block
    b337 - block
    b205 - block
    b2 - block
    b275 - block
    b165 - block
    b970 - block
    b804 - block
    b599 - block
    b24 - block
    b646 - block
    b778 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b174 )
    ( on b691 b174 )
    ( on b609 b691 )
    ( on b939 b609 )
    ( on b289 b939 )
    ( on b847 b289 )
    ( on b989 b847 )
    ( on b464 b989 )
    ( on b337 b464 )
    ( on b205 b337 )
    ( on b2 b205 )
    ( on b275 b2 )
    ( on b165 b275 )
    ( on b970 b165 )
    ( on b804 b970 )
    ( on b599 b804 )
    ( on b24 b599 )
    ( on b646 b24 )
    ( on b778 b646 )
    ( clear b778 )
  )
  ( :goal
    ( and
      ( clear b174 )
    )
  )
)
