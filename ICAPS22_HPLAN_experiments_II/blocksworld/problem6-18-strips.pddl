( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b474 - block
    b125 - block
    b665 - block
    b141 - block
    b670 - block
    b146 - block
    b482 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b474 )
    ( on b125 b474 )
    ( on b665 b125 )
    ( on b141 b665 )
    ( on b670 b141 )
    ( on b146 b670 )
    ( on b482 b146 )
    ( clear b482 )
  )
  ( :goal
    ( and
      ( clear b474 )
    )
  )
)
