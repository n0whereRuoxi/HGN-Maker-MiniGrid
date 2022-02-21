( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b882 - block
    b899 - block
    b853 - block
    b567 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b882 )
    ( on b899 b882 )
    ( on b853 b899 )
    ( on b567 b853 )
    ( clear b567 )
  )
  ( :goal
    ( and
      ( clear b882 )
    )
  )
)
