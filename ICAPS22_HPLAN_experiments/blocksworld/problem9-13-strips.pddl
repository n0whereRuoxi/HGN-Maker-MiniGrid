( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b389 - block
    b862 - block
    b382 - block
    b276 - block
    b953 - block
    b501 - block
    b311 - block
    b708 - block
    b978 - block
    b821 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b389 )
    ( on b862 b389 )
    ( on b382 b862 )
    ( on b276 b382 )
    ( on b953 b276 )
    ( on b501 b953 )
    ( on b311 b501 )
    ( on b708 b311 )
    ( on b978 b708 )
    ( on b821 b978 )
    ( clear b821 )
  )
  ( :goal
    ( and
      ( clear b389 )
    )
  )
)
