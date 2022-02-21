( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b494 - block
    b27 - block
    b20 - block
    b885 - block
    b47 - block
    b406 - block
    b996 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b494 )
    ( on b27 b494 )
    ( on b20 b27 )
    ( on b885 b20 )
    ( on b47 b885 )
    ( on b406 b47 )
    ( on b996 b406 )
    ( clear b996 )
  )
  ( :goal
    ( and
      ( clear b494 )
    )
  )
)
