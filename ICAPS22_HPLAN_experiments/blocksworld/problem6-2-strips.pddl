( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b424 - block
    b963 - block
    b762 - block
    b130 - block
    b61 - block
    b96 - block
    b20 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b424 )
    ( on b963 b424 )
    ( on b762 b963 )
    ( on b130 b762 )
    ( on b61 b130 )
    ( on b96 b61 )
    ( on b20 b96 )
    ( clear b20 )
  )
  ( :goal
    ( and
      ( clear b424 )
    )
  )
)
