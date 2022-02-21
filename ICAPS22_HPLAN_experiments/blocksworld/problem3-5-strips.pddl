( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b629 - block
    b938 - block
    b556 - block
    b580 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b629 )
    ( on b938 b629 )
    ( on b556 b938 )
    ( on b580 b556 )
    ( clear b580 )
  )
  ( :goal
    ( and
      ( clear b629 )
    )
  )
)
