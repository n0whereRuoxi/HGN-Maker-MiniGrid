( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b623 - block
    b302 - block
    b360 - block
    b46 - block
    b825 - block
    b332 - block
    b861 - block
    b614 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b623 )
    ( on b302 b623 )
    ( on b360 b302 )
    ( on b46 b360 )
    ( on b825 b46 )
    ( on b332 b825 )
    ( on b861 b332 )
    ( on b614 b861 )
    ( clear b614 )
  )
  ( :goal
    ( and
      ( clear b623 )
    )
  )
)
