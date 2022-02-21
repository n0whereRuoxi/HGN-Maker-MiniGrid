( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b216 - block
    b75 - block
    b559 - block
    b360 - block
    b663 - block
    b967 - block
    b183 - block
    b109 - block
    b909 - block
    b45 - block
    b789 - block
    b605 - block
    b95 - block
    b199 - block
    b777 - block
    b155 - block
    b740 - block
    b856 - block
    b160 - block
    b668 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b216 )
    ( on b75 b216 )
    ( on b559 b75 )
    ( on b360 b559 )
    ( on b663 b360 )
    ( on b967 b663 )
    ( on b183 b967 )
    ( on b109 b183 )
    ( on b909 b109 )
    ( on b45 b909 )
    ( on b789 b45 )
    ( on b605 b789 )
    ( on b95 b605 )
    ( on b199 b95 )
    ( on b777 b199 )
    ( on b155 b777 )
    ( on b740 b155 )
    ( on b856 b740 )
    ( on b160 b856 )
    ( on b668 b160 )
    ( clear b668 )
  )
  ( :goal
    ( and
      ( clear b216 )
    )
  )
)
