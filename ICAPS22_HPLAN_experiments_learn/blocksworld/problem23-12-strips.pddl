( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b480 - block
    b689 - block
    b490 - block
    b221 - block
    b683 - block
    b973 - block
    b800 - block
    b34 - block
    b481 - block
    b744 - block
    b99 - block
    b424 - block
    b338 - block
    b43 - block
    b134 - block
    b535 - block
    b479 - block
    b39 - block
    b198 - block
    b988 - block
    b922 - block
    b237 - block
    b391 - block
    b805 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b480 )
    ( on b689 b480 )
    ( on b490 b689 )
    ( on b221 b490 )
    ( on b683 b221 )
    ( on b973 b683 )
    ( on b800 b973 )
    ( on b34 b800 )
    ( on b481 b34 )
    ( on b744 b481 )
    ( on b99 b744 )
    ( on b424 b99 )
    ( on b338 b424 )
    ( on b43 b338 )
    ( on b134 b43 )
    ( on b535 b134 )
    ( on b479 b535 )
    ( on b39 b479 )
    ( on b198 b39 )
    ( on b988 b198 )
    ( on b922 b988 )
    ( on b237 b922 )
    ( on b391 b237 )
    ( on b805 b391 )
    ( clear b805 )
  )
  ( :goal
    ( and
      ( clear b480 )
    )
  )
)
