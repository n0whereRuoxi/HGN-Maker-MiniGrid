( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b533 - block
    b703 - block
    b122 - block
    b624 - block
    b291 - block
    b140 - block
    b904 - block
    b551 - block
    b892 - block
    b593 - block
    b217 - block
    b989 - block
    b153 - block
    b870 - block
    b178 - block
    b469 - block
    b48 - block
    b304 - block
    b125 - block
    b299 - block
    b424 - block
    b483 - block
    b485 - block
    b627 - block
    b568 - block
    b265 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b533 )
    ( on b703 b533 )
    ( on b122 b703 )
    ( on b624 b122 )
    ( on b291 b624 )
    ( on b140 b291 )
    ( on b904 b140 )
    ( on b551 b904 )
    ( on b892 b551 )
    ( on b593 b892 )
    ( on b217 b593 )
    ( on b989 b217 )
    ( on b153 b989 )
    ( on b870 b153 )
    ( on b178 b870 )
    ( on b469 b178 )
    ( on b48 b469 )
    ( on b304 b48 )
    ( on b125 b304 )
    ( on b299 b125 )
    ( on b424 b299 )
    ( on b483 b424 )
    ( on b485 b483 )
    ( on b627 b485 )
    ( on b568 b627 )
    ( on b265 b568 )
    ( clear b265 )
  )
  ( :goal
    ( and
      ( clear b533 )
    )
  )
)
