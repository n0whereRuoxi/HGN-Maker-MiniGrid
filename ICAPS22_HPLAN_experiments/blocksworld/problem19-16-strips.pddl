( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b641 - block
    b714 - block
    b536 - block
    b314 - block
    b67 - block
    b508 - block
    b838 - block
    b724 - block
    b551 - block
    b306 - block
    b622 - block
    b643 - block
    b116 - block
    b39 - block
    b201 - block
    b811 - block
    b415 - block
    b25 - block
    b667 - block
    b794 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b641 )
    ( on b714 b641 )
    ( on b536 b714 )
    ( on b314 b536 )
    ( on b67 b314 )
    ( on b508 b67 )
    ( on b838 b508 )
    ( on b724 b838 )
    ( on b551 b724 )
    ( on b306 b551 )
    ( on b622 b306 )
    ( on b643 b622 )
    ( on b116 b643 )
    ( on b39 b116 )
    ( on b201 b39 )
    ( on b811 b201 )
    ( on b415 b811 )
    ( on b25 b415 )
    ( on b667 b25 )
    ( on b794 b667 )
    ( clear b794 )
  )
  ( :goal
    ( and
      ( clear b641 )
    )
  )
)
