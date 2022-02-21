( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b671 - block
    b66 - block
    b614 - block
    b459 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b671 )
    ( on b66 b671 )
    ( on b614 b66 )
    ( on b459 b614 )
    ( clear b459 )
  )
  ( :goal
    ( and
      ( clear b671 )
    )
  )
)
