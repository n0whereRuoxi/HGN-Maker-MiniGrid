( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b96 - block
    b572 - block
    b907 - block
    b605 - block
    b480 - block
    b950 - block
    b853 - block
    b637 - block
    b98 - block
    b775 - block
    b16 - block
    b601 - block
    b896 - block
    b731 - block
    b526 - block
    b885 - block
    b811 - block
    b278 - block
    b809 - block
    b931 - block
    b363 - block
    b578 - block
    b942 - block
    b901 - block
    b383 - block
    b46 - block
    b699 - block
    b65 - block
    b789 - block
    b206 - block
    b295 - block
    b584 - block
    b824 - block
    b680 - block
    b38 - block
    b304 - block
    b208 - block
    b507 - block
    b367 - block
    b15 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b96 )
    ( on b572 b96 )
    ( on b907 b572 )
    ( on b605 b907 )
    ( on b480 b605 )
    ( on b950 b480 )
    ( on b853 b950 )
    ( on b637 b853 )
    ( on b98 b637 )
    ( on b775 b98 )
    ( on b16 b775 )
    ( on b601 b16 )
    ( on b896 b601 )
    ( on b731 b896 )
    ( on b526 b731 )
    ( on b885 b526 )
    ( on b811 b885 )
    ( on b278 b811 )
    ( on b809 b278 )
    ( on b931 b809 )
    ( on b363 b931 )
    ( on b578 b363 )
    ( on b942 b578 )
    ( on b901 b942 )
    ( on b383 b901 )
    ( on b46 b383 )
    ( on b699 b46 )
    ( on b65 b699 )
    ( on b789 b65 )
    ( on b206 b789 )
    ( on b295 b206 )
    ( on b584 b295 )
    ( on b824 b584 )
    ( on b680 b824 )
    ( on b38 b680 )
    ( on b304 b38 )
    ( on b208 b304 )
    ( on b507 b208 )
    ( on b367 b507 )
    ( on b15 b367 )
    ( clear b15 )
  )
  ( :goal
    ( and
      ( clear b96 )
    )
  )
)
