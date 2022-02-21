( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b356 - block
    b305 - block
    b221 - block
    b49 - block
    b953 - block
    b232 - block
    b708 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b356 )
    ( on b305 b356 )
    ( on b221 b305 )
    ( on b49 b221 )
    ( on b953 b49 )
    ( on b232 b953 )
    ( on b708 b232 )
    ( clear b708 )
  )
  ( :goal
    ( and
      ( clear b356 )
    )
  )
)
