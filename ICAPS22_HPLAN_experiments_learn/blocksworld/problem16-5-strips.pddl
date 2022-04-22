( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b172 - block
    b910 - block
    b935 - block
    b127 - block
    b12 - block
    b529 - block
    b600 - block
    b518 - block
    b528 - block
    b687 - block
    b936 - block
    b371 - block
    b481 - block
    b959 - block
    b457 - block
    b705 - block
    b565 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b172 )
    ( on b910 b172 )
    ( on b935 b910 )
    ( on b127 b935 )
    ( on b12 b127 )
    ( on b529 b12 )
    ( on b600 b529 )
    ( on b518 b600 )
    ( on b528 b518 )
    ( on b687 b528 )
    ( on b936 b687 )
    ( on b371 b936 )
    ( on b481 b371 )
    ( on b959 b481 )
    ( on b457 b959 )
    ( on b705 b457 )
    ( on b565 b705 )
    ( clear b565 )
  )
  ( :goal
    ( and
      ( clear b172 )
    )
  )
)
