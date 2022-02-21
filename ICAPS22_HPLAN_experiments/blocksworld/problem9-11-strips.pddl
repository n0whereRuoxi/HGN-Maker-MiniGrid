( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b275 - block
    b561 - block
    b316 - block
    b945 - block
    b78 - block
    b864 - block
    b939 - block
    b508 - block
    b962 - block
    b273 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b275 )
    ( on b561 b275 )
    ( on b316 b561 )
    ( on b945 b316 )
    ( on b78 b945 )
    ( on b864 b78 )
    ( on b939 b864 )
    ( on b508 b939 )
    ( on b962 b508 )
    ( on b273 b962 )
    ( clear b273 )
  )
  ( :goal
    ( and
      ( clear b275 )
    )
  )
)
