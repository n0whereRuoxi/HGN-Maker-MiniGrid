( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b750 - block
    b488 - block
    b609 - block
    b11 - block
    b613 - block
    b379 - block
    b455 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b750 )
    ( on b488 b750 )
    ( on b609 b488 )
    ( on b11 b609 )
    ( on b613 b11 )
    ( on b379 b613 )
    ( on b455 b379 )
    ( clear b455 )
  )
  ( :goal
    ( and
      ( clear b750 )
    )
  )
)
