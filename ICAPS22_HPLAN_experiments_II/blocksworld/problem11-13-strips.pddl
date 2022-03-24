( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b137 - block
    b694 - block
    b542 - block
    b461 - block
    b976 - block
    b191 - block
    b53 - block
    b910 - block
    b469 - block
    b428 - block
    b535 - block
    b834 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b137 )
    ( on b694 b137 )
    ( on b542 b694 )
    ( on b461 b542 )
    ( on b976 b461 )
    ( on b191 b976 )
    ( on b53 b191 )
    ( on b910 b53 )
    ( on b469 b910 )
    ( on b428 b469 )
    ( on b535 b428 )
    ( on b834 b535 )
    ( clear b834 )
  )
  ( :goal
    ( and
      ( clear b137 )
    )
  )
)
