( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b578 - block
    b870 - block
    b224 - block
    b676 - block
    b25 - block
    b70 - block
    b815 - block
    b691 - block
    b884 - block
    b455 - block
    b599 - block
    b74 - block
    b624 - block
    b233 - block
    b166 - block
    b430 - block
    b795 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b578 )
    ( on b870 b578 )
    ( on b224 b870 )
    ( on b676 b224 )
    ( on b25 b676 )
    ( on b70 b25 )
    ( on b815 b70 )
    ( on b691 b815 )
    ( on b884 b691 )
    ( on b455 b884 )
    ( on b599 b455 )
    ( on b74 b599 )
    ( on b624 b74 )
    ( on b233 b624 )
    ( on b166 b233 )
    ( on b430 b166 )
    ( on b795 b430 )
    ( clear b795 )
  )
  ( :goal
    ( and
      ( clear b578 )
    )
  )
)
