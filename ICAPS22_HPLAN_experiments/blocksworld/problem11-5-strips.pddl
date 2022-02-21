( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b984 - block
    b491 - block
    b445 - block
    b103 - block
    b965 - block
    b137 - block
    b16 - block
    b922 - block
    b780 - block
    b573 - block
    b456 - block
    b332 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b984 )
    ( on b491 b984 )
    ( on b445 b491 )
    ( on b103 b445 )
    ( on b965 b103 )
    ( on b137 b965 )
    ( on b16 b137 )
    ( on b922 b16 )
    ( on b780 b922 )
    ( on b573 b780 )
    ( on b456 b573 )
    ( on b332 b456 )
    ( clear b332 )
  )
  ( :goal
    ( and
      ( clear b984 )
    )
  )
)
