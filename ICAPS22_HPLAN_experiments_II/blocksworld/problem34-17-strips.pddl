( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b840 - block
    b153 - block
    b141 - block
    b423 - block
    b904 - block
    b732 - block
    b718 - block
    b108 - block
    b124 - block
    b695 - block
    b881 - block
    b963 - block
    b995 - block
    b21 - block
    b716 - block
    b68 - block
    b322 - block
    b762 - block
    b80 - block
    b114 - block
    b242 - block
    b801 - block
    b580 - block
    b910 - block
    b195 - block
    b246 - block
    b444 - block
    b483 - block
    b14 - block
    b557 - block
    b359 - block
    b686 - block
    b138 - block
    b329 - block
    b221 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b840 )
    ( on b153 b840 )
    ( on b141 b153 )
    ( on b423 b141 )
    ( on b904 b423 )
    ( on b732 b904 )
    ( on b718 b732 )
    ( on b108 b718 )
    ( on b124 b108 )
    ( on b695 b124 )
    ( on b881 b695 )
    ( on b963 b881 )
    ( on b995 b963 )
    ( on b21 b995 )
    ( on b716 b21 )
    ( on b68 b716 )
    ( on b322 b68 )
    ( on b762 b322 )
    ( on b80 b762 )
    ( on b114 b80 )
    ( on b242 b114 )
    ( on b801 b242 )
    ( on b580 b801 )
    ( on b910 b580 )
    ( on b195 b910 )
    ( on b246 b195 )
    ( on b444 b246 )
    ( on b483 b444 )
    ( on b14 b483 )
    ( on b557 b14 )
    ( on b359 b557 )
    ( on b686 b359 )
    ( on b138 b686 )
    ( on b329 b138 )
    ( on b221 b329 )
    ( clear b221 )
  )
  ( :goal
    ( and
      ( clear b840 )
    )
  )
)
