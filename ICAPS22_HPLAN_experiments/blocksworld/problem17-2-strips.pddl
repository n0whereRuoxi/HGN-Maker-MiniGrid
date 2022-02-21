( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b904 - block
    b971 - block
    b488 - block
    b181 - block
    b811 - block
    b84 - block
    b590 - block
    b510 - block
    b314 - block
    b633 - block
    b527 - block
    b227 - block
    b245 - block
    b925 - block
    b568 - block
    b784 - block
    b677 - block
    b200 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b904 )
    ( on b971 b904 )
    ( on b488 b971 )
    ( on b181 b488 )
    ( on b811 b181 )
    ( on b84 b811 )
    ( on b590 b84 )
    ( on b510 b590 )
    ( on b314 b510 )
    ( on b633 b314 )
    ( on b527 b633 )
    ( on b227 b527 )
    ( on b245 b227 )
    ( on b925 b245 )
    ( on b568 b925 )
    ( on b784 b568 )
    ( on b677 b784 )
    ( on b200 b677 )
    ( clear b200 )
  )
  ( :goal
    ( and
      ( clear b904 )
    )
  )
)
