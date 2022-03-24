( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b801 - block
    b299 - block
    b637 - block
    b173 - block
    b466 - block
    b964 - block
    b236 - block
    b904 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b801 )
    ( on b299 b801 )
    ( on b637 b299 )
    ( on b173 b637 )
    ( on b466 b173 )
    ( on b964 b466 )
    ( on b236 b964 )
    ( on b904 b236 )
    ( clear b904 )
  )
  ( :goal
    ( and
      ( clear b801 )
    )
  )
)
