( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b642 - block
    b364 - block
    b731 - block
    b169 - block
    b70 - block
    b108 - block
    b786 - block
    b471 - block
    b61 - block
    b442 - block
    b3 - block
    b381 - block
    b880 - block
    b904 - block
    b179 - block
    b529 - block
    b10 - block
    b219 - block
    b943 - block
    b171 - block
    b238 - block
    b232 - block
    b811 - block
    b80 - block
    b851 - block
    b257 - block
    b150 - block
    b984 - block
    b893 - block
    b383 - block
    b338 - block
    b396 - block
    b182 - block
    b871 - block
    b423 - block
    b744 - block
    b940 - block
    b926 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b642 )
    ( on b364 b642 )
    ( on b731 b364 )
    ( on b169 b731 )
    ( on b70 b169 )
    ( on b108 b70 )
    ( on b786 b108 )
    ( on b471 b786 )
    ( on b61 b471 )
    ( on b442 b61 )
    ( on b3 b442 )
    ( on b381 b3 )
    ( on b880 b381 )
    ( on b904 b880 )
    ( on b179 b904 )
    ( on b529 b179 )
    ( on b10 b529 )
    ( on b219 b10 )
    ( on b943 b219 )
    ( on b171 b943 )
    ( on b238 b171 )
    ( on b232 b238 )
    ( on b811 b232 )
    ( on b80 b811 )
    ( on b851 b80 )
    ( on b257 b851 )
    ( on b150 b257 )
    ( on b984 b150 )
    ( on b893 b984 )
    ( on b383 b893 )
    ( on b338 b383 )
    ( on b396 b338 )
    ( on b182 b396 )
    ( on b871 b182 )
    ( on b423 b871 )
    ( on b744 b423 )
    ( on b940 b744 )
    ( on b926 b940 )
    ( clear b926 )
  )
  ( :goal
    ( and
      ( clear b642 )
    )
  )
)
