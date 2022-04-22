( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b94 - block
    b656 - block
    b108 - block
    b914 - block
    b371 - block
    b561 - block
    b641 - block
    b900 - block
    b756 - block
    b295 - block
    b653 - block
    b871 - block
    b28 - block
    b727 - block
    b551 - block
    b457 - block
    b904 - block
    b282 - block
    b315 - block
    b969 - block
    b118 - block
    b332 - block
    b171 - block
    b477 - block
    b419 - block
    b680 - block
    b979 - block
    b666 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b94 )
    ( on b656 b94 )
    ( on b108 b656 )
    ( on b914 b108 )
    ( on b371 b914 )
    ( on b561 b371 )
    ( on b641 b561 )
    ( on b900 b641 )
    ( on b756 b900 )
    ( on b295 b756 )
    ( on b653 b295 )
    ( on b871 b653 )
    ( on b28 b871 )
    ( on b727 b28 )
    ( on b551 b727 )
    ( on b457 b551 )
    ( on b904 b457 )
    ( on b282 b904 )
    ( on b315 b282 )
    ( on b969 b315 )
    ( on b118 b969 )
    ( on b332 b118 )
    ( on b171 b332 )
    ( on b477 b171 )
    ( on b419 b477 )
    ( on b680 b419 )
    ( on b979 b680 )
    ( on b666 b979 )
    ( clear b666 )
  )
  ( :goal
    ( and
      ( clear b94 )
    )
  )
)
