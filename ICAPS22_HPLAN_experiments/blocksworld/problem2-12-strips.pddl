( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b841 - block
    b250 - block
    b804 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b841 )
    ( on b250 b841 )
    ( on b804 b250 )
    ( clear b804 )
  )
  ( :goal
    ( and
      ( clear b841 )
    )
  )
)
