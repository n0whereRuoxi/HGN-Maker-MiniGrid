( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b565 - block
    b12 - block
    b210 - block
    b899 - block
    b115 - block
    b723 - block
    b939 - block
    b72 - block
    b508 - block
    b946 - block
    b384 - block
    b125 - block
    b98 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b565 )
    ( on b12 b565 )
    ( on b210 b12 )
    ( on b899 b210 )
    ( on b115 b899 )
    ( on b723 b115 )
    ( on b939 b723 )
    ( on b72 b939 )
    ( on b508 b72 )
    ( on b946 b508 )
    ( on b384 b946 )
    ( on b125 b384 )
    ( on b98 b125 )
    ( clear b98 )
  )
  ( :goal
    ( and
      ( clear b565 )
    )
  )
)
