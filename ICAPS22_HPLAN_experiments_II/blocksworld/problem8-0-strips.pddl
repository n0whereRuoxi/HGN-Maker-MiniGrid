( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b384 - block
    b723 - block
    b575 - block
    b613 - block
    b559 - block
    b536 - block
    b446 - block
    b392 - block
    b287 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b384 )
    ( on b723 b384 )
    ( on b575 b723 )
    ( on b613 b575 )
    ( on b559 b613 )
    ( on b536 b559 )
    ( on b446 b536 )
    ( on b392 b446 )
    ( on b287 b392 )
    ( clear b287 )
  )
  ( :goal
    ( and
      ( clear b384 )
    )
  )
)
