( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b825 - block
    b323 - block
    b512 - block
    b74 - block
    b461 - block
    b894 - block
    b858 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b825 )
    ( on b323 b825 )
    ( on b512 b323 )
    ( on b74 b512 )
    ( on b461 b74 )
    ( on b894 b461 )
    ( on b858 b894 )
    ( clear b858 )
  )
  ( :goal
    ( and
      ( clear b825 )
    )
  )
)
