( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b754 - block
    b487 - block
    b944 - block
    b798 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b754 )
    ( on b487 b754 )
    ( on b944 b487 )
    ( on b798 b944 )
    ( clear b798 )
  )
  ( :goal
    ( and
      ( clear b754 )
    )
  )
)
