( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b293 - block
    b486 - block
    b28 - block
    b594 - block
    b234 - block
    b341 - block
    b89 - block
    b102 - block
    b36 - block
    b441 - block
    b727 - block
    b63 - block
    b208 - block
    b111 - block
    b881 - block
    b780 - block
    b416 - block
    b916 - block
    b396 - block
    b90 - block
    b23 - block
    b689 - block
    b982 - block
    b155 - block
    b507 - block
    b904 - block
    b464 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b293 )
    ( on b486 b293 )
    ( on b28 b486 )
    ( on b594 b28 )
    ( on b234 b594 )
    ( on b341 b234 )
    ( on b89 b341 )
    ( on b102 b89 )
    ( on b36 b102 )
    ( on b441 b36 )
    ( on b727 b441 )
    ( on b63 b727 )
    ( on b208 b63 )
    ( on b111 b208 )
    ( on b881 b111 )
    ( on b780 b881 )
    ( on b416 b780 )
    ( on b916 b416 )
    ( on b396 b916 )
    ( on b90 b396 )
    ( on b23 b90 )
    ( on b689 b23 )
    ( on b982 b689 )
    ( on b155 b982 )
    ( on b507 b155 )
    ( on b904 b507 )
    ( on b464 b904 )
    ( clear b464 )
  )
  ( :goal
    ( and
      ( clear b293 )
    )
  )
)
