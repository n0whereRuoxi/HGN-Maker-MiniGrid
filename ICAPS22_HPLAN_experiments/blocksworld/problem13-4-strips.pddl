( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b965 - block
    b354 - block
    b484 - block
    b97 - block
    b188 - block
    b85 - block
    b39 - block
    b879 - block
    b236 - block
    b519 - block
    b930 - block
    b781 - block
    b136 - block
    b604 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b965 )
    ( on b354 b965 )
    ( on b484 b354 )
    ( on b97 b484 )
    ( on b188 b97 )
    ( on b85 b188 )
    ( on b39 b85 )
    ( on b879 b39 )
    ( on b236 b879 )
    ( on b519 b236 )
    ( on b930 b519 )
    ( on b781 b930 )
    ( on b136 b781 )
    ( on b604 b136 )
    ( clear b604 )
  )
  ( :goal
    ( and
      ( clear b965 )
    )
  )
)
