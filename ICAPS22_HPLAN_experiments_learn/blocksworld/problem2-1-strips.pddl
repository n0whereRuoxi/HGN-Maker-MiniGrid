( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b594 - block
    b690 - block
    b997 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b594 )
    ( on b690 b594 )
    ( on b997 b690 )
    ( clear b997 )
  )
  ( :goal
    ( and
      ( clear b594 )
    )
  )
)
