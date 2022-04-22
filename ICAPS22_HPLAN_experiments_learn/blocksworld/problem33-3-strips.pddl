( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b660 - block
    b773 - block
    b790 - block
    b780 - block
    b742 - block
    b410 - block
    b35 - block
    b529 - block
    b84 - block
    b71 - block
    b402 - block
    b495 - block
    b438 - block
    b115 - block
    b341 - block
    b161 - block
    b98 - block
    b929 - block
    b995 - block
    b689 - block
    b286 - block
    b456 - block
    b969 - block
    b63 - block
    b808 - block
    b712 - block
    b875 - block
    b333 - block
    b175 - block
    b162 - block
    b635 - block
    b123 - block
    b278 - block
    b149 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b660 )
    ( on b773 b660 )
    ( on b790 b773 )
    ( on b780 b790 )
    ( on b742 b780 )
    ( on b410 b742 )
    ( on b35 b410 )
    ( on b529 b35 )
    ( on b84 b529 )
    ( on b71 b84 )
    ( on b402 b71 )
    ( on b495 b402 )
    ( on b438 b495 )
    ( on b115 b438 )
    ( on b341 b115 )
    ( on b161 b341 )
    ( on b98 b161 )
    ( on b929 b98 )
    ( on b995 b929 )
    ( on b689 b995 )
    ( on b286 b689 )
    ( on b456 b286 )
    ( on b969 b456 )
    ( on b63 b969 )
    ( on b808 b63 )
    ( on b712 b808 )
    ( on b875 b712 )
    ( on b333 b875 )
    ( on b175 b333 )
    ( on b162 b175 )
    ( on b635 b162 )
    ( on b123 b635 )
    ( on b278 b123 )
    ( on b149 b278 )
    ( clear b149 )
  )
  ( :goal
    ( and
      ( clear b660 )
    )
  )
)
