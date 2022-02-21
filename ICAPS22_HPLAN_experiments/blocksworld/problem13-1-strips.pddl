( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b871 - block
    b542 - block
    b913 - block
    b283 - block
    b261 - block
    b732 - block
    b145 - block
    b587 - block
    b701 - block
    b830 - block
    b109 - block
    b593 - block
    b811 - block
    b19 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b871 )
    ( on b542 b871 )
    ( on b913 b542 )
    ( on b283 b913 )
    ( on b261 b283 )
    ( on b732 b261 )
    ( on b145 b732 )
    ( on b587 b145 )
    ( on b701 b587 )
    ( on b830 b701 )
    ( on b109 b830 )
    ( on b593 b109 )
    ( on b811 b593 )
    ( on b19 b811 )
    ( clear b19 )
  )
  ( :goal
    ( and
      ( clear b871 )
    )
  )
)
