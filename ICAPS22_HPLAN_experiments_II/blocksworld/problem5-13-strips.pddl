( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b137 - block
    b65 - block
    b623 - block
    b542 - block
    b210 - block
    b71 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b137 )
    ( on b65 b137 )
    ( on b623 b65 )
    ( on b542 b623 )
    ( on b210 b542 )
    ( on b71 b210 )
    ( clear b71 )
  )
  ( :goal
    ( and
      ( clear b137 )
    )
  )
)
