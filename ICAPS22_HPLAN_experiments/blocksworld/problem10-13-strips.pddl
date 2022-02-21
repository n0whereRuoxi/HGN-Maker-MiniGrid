( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b365 - block
    b216 - block
    b570 - block
    b238 - block
    b286 - block
    b141 - block
    b797 - block
    b917 - block
    b439 - block
    b123 - block
    b959 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b365 )
    ( on b216 b365 )
    ( on b570 b216 )
    ( on b238 b570 )
    ( on b286 b238 )
    ( on b141 b286 )
    ( on b797 b141 )
    ( on b917 b797 )
    ( on b439 b917 )
    ( on b123 b439 )
    ( on b959 b123 )
    ( clear b959 )
  )
  ( :goal
    ( and
      ( clear b365 )
    )
  )
)
