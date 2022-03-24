( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b189 - block
    b487 - block
    b665 - block
    b398 - block
    b435 - block
    b545 - block
    b780 - block
    b634 - block
    b177 - block
    b733 - block
    b643 - block
    b390 - block
    b946 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b189 )
    ( on b487 b189 )
    ( on b665 b487 )
    ( on b398 b665 )
    ( on b435 b398 )
    ( on b545 b435 )
    ( on b780 b545 )
    ( on b634 b780 )
    ( on b177 b634 )
    ( on b733 b177 )
    ( on b643 b733 )
    ( on b390 b643 )
    ( on b946 b390 )
    ( clear b946 )
  )
  ( :goal
    ( and
      ( clear b189 )
    )
  )
)
