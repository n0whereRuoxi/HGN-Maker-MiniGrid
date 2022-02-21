( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b205 - block
    b910 - block
    b15 - block
    b817 - block
    b812 - block
    b43 - block
    b6 - block
    b588 - block
    b82 - block
    b63 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b205 )
    ( on b910 b205 )
    ( on b15 b910 )
    ( on b817 b15 )
    ( on b812 b817 )
    ( on b43 b812 )
    ( on b6 b43 )
    ( on b588 b6 )
    ( on b82 b588 )
    ( on b63 b82 )
    ( clear b63 )
  )
  ( :goal
    ( and
      ( clear b205 )
    )
  )
)
